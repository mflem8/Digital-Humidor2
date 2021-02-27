class Brand < ApplicationRecord
    has_many :cigars

    validates :name, presence: true

    def self.alphabetical
        order(:name)
      end
end
