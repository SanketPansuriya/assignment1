class Patient < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :appointments
  has_many :physicians, through: :appointments
end
