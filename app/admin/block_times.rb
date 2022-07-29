# frozen_string_literal: true

ActiveAdmin.register BlockTime do
  permit_params :start, :end
end
