class Review < ApplicationRecord
belongs_to :user
belongs_to :photographer

validates :comment, presence: true
end 