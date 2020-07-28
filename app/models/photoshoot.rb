class Photoshoot < ActiveRecord::Base
    belongs_to :client
    belongs_to :location

    #validation for photographer, client, location?
end 