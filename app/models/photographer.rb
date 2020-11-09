class Photographer < ApplicationRecord
has_many :reviews
has_many :users, through: :reviews 

    def self.search(search)
        if search 
         photographer = Photographer.find_by(name: search)
            if photographer 
                self.where(photographer_id: photographer)
            else
                Photographer.all 
            end 
         else 
            Photographer.all 
         end
    end 

end  