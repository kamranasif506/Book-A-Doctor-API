class Doctor < ApplicationRecord
  belongs_to :specialization
  has_many :appointments, dependent: :destroy

  # validates :doctor_name, presence: true
  # validates :profile_picture, presence: true
  # validates :bio, presence: true
end
