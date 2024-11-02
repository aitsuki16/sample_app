class User < ApplicationRecord
  # Ensure email is saved as lowercase before saving
  before_save { self.email = email.downcase }

  # Validation for name: required and with a max length of 50 characters
  validates :name, presence: true, length: { maximum: 50 }

  # Regex for valid email format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validation for email: required, properly formatted, and unique
  validates :email, presence: true, 
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  # Enable password hashing and authentication methods
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end
