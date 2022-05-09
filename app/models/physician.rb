class Physician < ApplicationRecord
	before_create :generate_unique_id
	
	validates :name, :email, presence: true
	validates :unique_id, uniqueness: true
	validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/, 
				message: " invalid"  }, 
				uniqueness: { case_sensitive: false }, 
				length: { minimum: 4, maximum: 254 }

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
