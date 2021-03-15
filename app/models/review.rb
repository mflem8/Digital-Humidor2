class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cigar

  validates :stars, :summary, presence: true

  scope :top, -> {where(stars: 5)}

  def self.top
    where(stars: 5)
  end
end
