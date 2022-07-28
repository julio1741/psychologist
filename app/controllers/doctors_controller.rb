class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy get_available_hours]
  before_action :set_hospitals, only: %i[ new edit index by_hospital ]
  before_action :set_work_days, only: %i[ new edit index ]
  before_action :set_block_times, only: %i[ new edit index ]

  # GET /doctors or /doctors.json
  def index
    @doctors = Doctor.all
  end

  def by_hospital
    @doctors = Doctor.where(hospital_id: params[:hospital_id])
    respond_to do |format|
      format.json { render :index }
    end
  end

  def get_doctor_working_days
    @working_days = @doctor.working_days
  end

  def get_doctor_working_hours
     @working_hours = @doctor.working_hours
  end

  def get_available_hours
    day = params[:day]
    @block_times, @work_day = helpers.get_doctor_availability(day, @doctor)
    respond_to do |format|
      format.json { render :get_available_hours }
    end
  end

  # GET /doctors/1 or /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors or /doctors.json
  def create
    @doctor = Doctor.new(doctor_params.except(:work_days))

    respond_to do |format|
      if @doctor.save
        add_working_days(@doctor, params[:doctor][:work_days])
        add_working_hours(@doctor, params[:doctor][:block_times])
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully created." }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params.except(:work_days))
        add_working_days(@doctor, params[:doctor][:work_days])
        add_working_hours(@doctor, params[:doctor][:block_times])
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1 or /doctors/1.json
  def destroy
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def add_working_days(doctor, work_days=[])
      return if work_days.blank?

      doctor.work_days.destroy_all
      work_days.each do |work_day|
        doctor.work_days << WorkDay.find_by(name: work_day)
      end
    end

    def add_working_hours(doctor, block_times=[])
      return if block_times.blank?

      doctor.block_times.destroy_all
      block_times.each do |block_time|
        doctor.block_times << BlockTime.find_by(id: block_time)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:firstname, :lastname, :phone, :hospital_id, :work_days, :block_times)
    end

    def set_hospitals
      @hospitals = Hospital.all
    end

    def set_work_days
      @work_days = WorkDay.all
    end

    def set_block_times
      @block_times = BlockTime.all
    end
end
