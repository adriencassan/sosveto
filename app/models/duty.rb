class Duty < ApplicationRecord
  has_many :consultations
  belongs_to :clinic, class_name: "Profile"
end
