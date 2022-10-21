class Review < ApplicationRecord
  RATINGS = [1, 2, 3, 4, 5]
  belongs_to :list
  validates :rating, inclusion: { in: RATINGS }
end
