class Location < ActiveRecord::Base
    has_many :photoshoots
    has_many :clients through: :photoshoots 

    validates :location, presence: true 
end 