class Photographer < ApplicationRecord
has_many :reviews
has_many :users, through: :reviews 

    def self.search(photographer_name)
       # byebug
        where("LOWER(name) LIKE ?", "%#{photographer_name}%")
       # if photographer_name 
        #    photographer = Photographer.find_by(name: photographer_name)
         #      if photographer
          #         self.where(photographer_id: photographer)
           #    else
            #       Photographer.all 
             #  end 
            #else 
             #  Photographer.all 
            #end
    end 

    def self.canon
       where("camera LIKE ?", "%Canon%")
    end 

end  