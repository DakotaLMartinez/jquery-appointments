class AppointmentLocationSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :street_address, :city, :state, :zipcode, :business_name
end
