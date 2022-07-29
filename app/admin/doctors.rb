# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :firstname, :lastname, :phone, :hospital_id, work_day_ids: [], block_time_ids: []

  form do |f|
    f.inputs 'Doctor information' do
      f.input :firstname
      f.input :lastname
      f.input :phone
      f.input :hospital_id, as: :select, collection: Hospital.all.map { |h|
                                                       [h.name, h.id]
                                                     }, include_blank: false
      f.input :work_days, as: :check_boxes
      f.input :block_times, as: :check_boxes, member_label: proc { |c|
                                                              "#{c.start.strftime('%I:%M %p')} #{c.end.strftime('%I:%M %p')}"
                                                            }
    end

    f.actions
  end
end
