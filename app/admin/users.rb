# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :username, :email, :password
end
