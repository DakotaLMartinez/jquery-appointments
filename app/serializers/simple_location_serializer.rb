class SimpleLocationSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :street_address, :city, :state, :zipcode, :business_name, :client_count, :appointment_count
end
