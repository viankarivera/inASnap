class Photographer < ApplicationRecord
has_many :reviews
has_many :users, through: :reviews 

    def self.search(search)
        if search 
         photographer_name = Photographer.find_by(name: search)
            if photographer_name
                self.where(photographer_id: photographer_name)
            else
                Photographer.all 
            end 
         else 
            Photographer.all 
         end
    end 

end  