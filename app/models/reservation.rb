class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :block_time
  belongs_to :work_day
  belongs_to :doctor

  validates_with RutValidator
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, :presence => true

  scope :by_user, ->(user_id) { where(user_id: user_id) }
end
