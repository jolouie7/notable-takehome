class Doctor < ApplicationRecord
  # Add some validations
  # Doctor first_name and last_name must be present
  has_many :appointments, dependent: :destroy
end
