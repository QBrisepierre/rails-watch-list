class Review < ApplicationRecord
  belongs_to :list

  validates :rating, presence: true
  validates :comment, length: { minimum: 6 }, presence: true
  validates :list_id, presence: true
end
