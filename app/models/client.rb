class Client < ActiveRecord::Base
  belongs_to :user
  has_many :appointments 
  has_many :locations, through: :appointments
  
  ## Validations 
  
  validates :name, presence: true 
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: 'Please enter a valid email address' }, allow_blank: true
  validates :phone_number, format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/, message: "Please enter a valid phone number (123) 456-7890" }, allow_blank: true
  
  include ActiveModel::Validations
  
  class UserIdValidator < ActiveModel::Validator
    def validate(record)
      if User.find_by(id: record.user_id)
        record.errors.delete :user_id
      else User.find_by(id: record.user_id)
        record.errors[:user_id] << "User not found."
      end
    end
  end
  
  # validates_with UserIdValidator
  
  ##
  
end