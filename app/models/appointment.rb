class Appointment < ApplicationRecord
  # Kind can only include 2 options
  OPTIONS = [['New_patient', 'new_patient'], ['Follow_up', 'follow_up']]
  validates_inclusion_of :kind, :in => OPTIONS

  belongs_to :doctor
end
