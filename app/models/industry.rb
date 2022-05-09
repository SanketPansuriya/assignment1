class Industry < ApplicationRecord
	has_and_belongs_to_many :sectors, dependent: :destroy

	validates :name,:email, presence: true
	validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/, 
				message: " invalid"  }, 
				uniqueness: { case_sensitive: false }, 
				length: { minimum: 4, maximum: 254 }

	before_create :generate_registration_number

	private
			def generate_registration_number
				loop do
					registration_number = "reg-"+SecureRandom.hex(3)+"-"+SecureRandom.hex(2).to_i(16).to_s+"-"+SecureRandom.hex(3)
					skip if registration_number.size != 23
					self.registration_number = registration_number
					break unless Industry.exists?(registration_number: registration_number)
				end
			end
end
