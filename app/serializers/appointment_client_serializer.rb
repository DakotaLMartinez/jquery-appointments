class AppointmentClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :email
end
