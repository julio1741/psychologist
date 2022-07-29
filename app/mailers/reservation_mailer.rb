# frozen_string_literal: true

class ReservationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def success
    @reservation = params[:reservation]
    @user = @reservation.user
    @doctor = @reservation.doctor
    @work_day = @reservation.work_day
    @block_time = @reservation.block_time
    @hospital = @doctor.hospital
    app_host = ENV.fetch('APP_HOST', nil)
    @url = "#{app_host}reservations/#{@reservation.id}/cancel"
    mail(to: @user.email, subject: 'Thank you for using Psychologist App')
  end
end
