class User < ApplicationRecord
has_many :ratings
has_many :photographers, through: :ratings 

validates :username, presence: true, uniqeness: true 
validates :email, presence: true 
has_secure_password 
end 