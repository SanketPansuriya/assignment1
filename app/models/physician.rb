class Physician < ApplicationRecord
	before_create :generate_unique_id
	
	validates :name, :email, presence: true
	validates :email, :unique_id, uniqueness: true

	has_many :appointments
	has_many :patients, through: :appointments
	private
			def generate_unique_id
					loop do
							unique_id = "P-"+SecureRandom.hex(3)+"-"+SecureRandom.hex(2).to_i(16).to_s+"-"+SecureRandom.hex(3)
							skip if unique_id.size != 21
							self.unique_id = unique_id
							break unless Physician.exists?(unique_id: unique_id)
					end
			end
end
