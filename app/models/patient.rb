class Patient < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/, 
				message: " invalid"  }, 
				uniqueness: { case_sensitive: false }, 
				length: { minimum: 4, maximum: 254 }

  has_many :appointments
  has_many :physicians, through: :appointments
end
