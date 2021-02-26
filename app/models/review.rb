class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cigar

  validates :stars, :summary, presence: true
end
