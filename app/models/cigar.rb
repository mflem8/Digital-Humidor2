class Cigar < ApplicationRecord
  belongs_to :brand
  belongs_to :user
end
