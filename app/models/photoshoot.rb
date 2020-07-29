class Photoshoot < ApplicationRecord
    belongs_to :client
    belongs_to :location 

    #validation for photographer, client, location?
end 