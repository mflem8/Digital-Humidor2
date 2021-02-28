class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_cigars, through: :reviews, source: :cigar
    has_many :cigars

    has_secure_password

    validates :username, uniqueness: true, presence: true

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end
    end
    
end
