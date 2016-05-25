class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :appointment_time, :duration, :price
  has_one :location, serializer: AppointmentLocationSerializer
  has_one :client
end
