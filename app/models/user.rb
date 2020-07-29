class User < ApplicationRecord
    has_many :clients
    has_many :photoshoots, through: :clients
    has_many :locations, through: :photoshoots 
    
    has_secure_password
    validates :username, presence: true, uniqueness: true
end