class LocationSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :street_address, :city, :state, :zipcode, :business_name
  has_many :appointments
  has_many :clients, serializer: LocationClientSerializer
end
