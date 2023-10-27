class Appointment < ApplicationRecord
  # Relationtip

  belongs_to :user
  belongs_to :doctor

  # Validation

  validates :date, inclusion: { in: (Date.today..Date.today + 1.year) }
  validates :time, inclusion: { in: (Time.parse('9:00 AM')..Time.parse('5:00 PM')) }
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
