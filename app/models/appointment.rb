class Appointment < ApplicationRecord
  validate :appointment_date, presence: true

  belongs_to :physician
  belongs_to :patient
end
