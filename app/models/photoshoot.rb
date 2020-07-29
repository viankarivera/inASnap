class Photoshoot < ApplicationRecord
    belongs_to :client
    belongs_to :user

    #validation for photographer, client, location?
end 