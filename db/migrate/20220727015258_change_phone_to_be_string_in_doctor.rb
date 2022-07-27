class ChangePhoneToBeStringInDoctor < ActiveRecord::Migration[7.0]
  def change
    change_column :doctors, :phone, :string
  end
end
