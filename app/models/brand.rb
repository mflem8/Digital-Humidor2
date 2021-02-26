class Brand < ApplicationRecord
    has_many :cigars

    validates :name, presence: true
end
