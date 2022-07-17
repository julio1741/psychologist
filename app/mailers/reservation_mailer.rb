class ReservationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def success
    @reservation = params[:reservation]
    @user = @reservation.user
    @doctor = @reservation.doctor
    @work_day = @reservation.work_day
    @block_time = @reservation.block_time
    @hospital = @doctor.hospital
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
