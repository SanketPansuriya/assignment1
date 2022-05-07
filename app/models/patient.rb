class Patient < ApplicationRecord
  validate :name, :email, presence: true
  validate :email, uniqueness: true

  has_many :appointments
  has_many :physicians, through: :appointments
end
