class ChangePhoneToBeStringInReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :phone, :string
  end
end
