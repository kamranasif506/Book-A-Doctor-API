class Specialization < ApplicationRecord
  has_many :doctors

  validates :doctor_name, presence: true
end
