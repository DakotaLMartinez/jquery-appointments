class CompleteLocationSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :street_address, :city, :state, :zipcode, :business_name
  has_many :appointments, include: { client: [:id, :name] }
  has_many :clients, serializer: LocationClientSerializer
end
