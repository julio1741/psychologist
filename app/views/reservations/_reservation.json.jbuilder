json.extract! reservation, :id, :firstname, :lastname, :phone, :day, :rut, :email, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
