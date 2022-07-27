class SessionsController < ApplicationController

  skip_before_action :require_login

  def new
    @user = User.new
    render :login
  end

  def create
    # normal create action
    @user = User.find_or_create_by(username: params[:user][:username])
    respond_to do |format|
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "Logged in successfully created." }
      else
        flash[:error] = "Sorry, your username or password was incorrect"
        format.html { render :login, status: :unprocessable_entity }
      end
    end
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def welcome
  end

  #logout
  def destroy
    session.clear
    redirect_to '/goodbye'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
