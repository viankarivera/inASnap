class Client < ApplicationRecord
    belongs_to :user
    has_many :photoshoots, through: :user 

    validates :name, presence: true
    validates :phone_number, presence: true 
    validates :price, presence: true 
end 