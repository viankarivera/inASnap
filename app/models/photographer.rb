class Photographer < ApplicationRecord
has_many :ratings, through: :users
has_many :users
end 