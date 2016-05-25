class LocationClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :email
end
