class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy cancel]
  before_action :set_hospitals, only: %i[new edit]
  before_action :set_doctors, only: %i[new edit]
  before_action :set_personal_info, only: %i[new edit]
  before_action :not_authorized_reservation, only: %i[show edit update cancel]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.by_user(current_user.id)
  end

  # GET /reservations/1 or /reservations/1.json
  def show; end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit; end

  def cancel; end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      @reservation.validate
      if @reservation.save
        format.html { redirect_to reservations_url, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        set_hospitals
        set_doctors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      @reservation.validate
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        set_hospitals
        set_doctors
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully canceled." }
      format.json { head :no_content }
    end
  end

  private

  def not_authorized_reservation
    if @reservation.user != current_user
      redirect_to reservations_path, notice: "¡You are not authorized to view this page!"
    end
  end

  def set_personal_info
    split_name = current_user.username.strip.split()
    @email = current_user.try(:email)
    @firstname = split_name.try(:first)
    @lastname = split_name.try(:last)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:firstname, :lastname, :phone, :day, :rut, :email, :block_time_id, :user_id, :work_day_id, :doctor_id)
  end

  def set_hospitals
    @hospitals = Hospital.all
  end

  def set_doctors
    @doctors = Doctor.all
  end
end
