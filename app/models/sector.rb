class Sector < ApplicationRecord
    has_and_belongs_to_many :industries, dependent: :destroy

    validates :name, presence: true
    validates :name,uniqueness: true
end
