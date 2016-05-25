class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :email
  has_many :appointments
end
