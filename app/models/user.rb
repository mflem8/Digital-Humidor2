class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_cigars, through: :reviews, source: :cigar

    has_many :cigars
end
