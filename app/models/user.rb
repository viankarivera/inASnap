class User < ApplicationRecord
has_many :reviews
has_many :photographers, through: :reviews 

validates :username, presence: true, uniqueness: true 
validates :email, presence: true 
has_secure_password 
end 