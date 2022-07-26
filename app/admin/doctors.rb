ActiveAdmin.register Doctor do
  permit_params :firstname, :lastname, :phone, :hospital_id
end
