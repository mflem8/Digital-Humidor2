class Cigar < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :brand

  validates :name, :style, presence: true
  validate :not_a_duplicate

  def not_a_duplicate
    cigar = Cigar.find_by(style: style, brand_id: brand_id)
    if !!cigar && cigar != self
      errors.add(:name, 'has already been added for that brand!')
    end
  end
  
end
