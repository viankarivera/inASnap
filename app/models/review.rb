class Review < ApplicationRecord
belongs_to :user
belongs_to :photographer

validates :comment, presence: true
scope :alphabetize, -> { Review.order(comment: :asc)}

end 