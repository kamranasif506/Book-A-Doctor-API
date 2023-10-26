class Doctor < ApplicationRecord
  belongs_to :specialization

  validates :doctor_name, presence: true
  validates :profile_picture, presence: true
  validates :bio, presence: true
end
