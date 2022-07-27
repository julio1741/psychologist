class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # normal create action
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "User created successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
