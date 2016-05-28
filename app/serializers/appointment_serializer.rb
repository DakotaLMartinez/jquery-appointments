class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :time_string, :duration, :price, :client_name
  has_one :location, serializer: AppointmentLocationSerializer
  has_one :client, serializer: AppointmentClientSerializer
end
