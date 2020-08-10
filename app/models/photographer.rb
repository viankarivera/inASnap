class Photographer < ApplicationRecord
has_many :reviews
has_many :users, through: :reviews 

   # def blank_stars
    #    5 - rating.to_i
    #end 

end 