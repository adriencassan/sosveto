class Profile < ApplicationRecord
  belongs_to :user

  belongs_to :clinic, class_name: 'Profile', optional: true
  has_many :profiles, foreign_key: 'clinic_id'

  has_many :duties, foreign_key: 'clinic_id'
  has_many :consultations, foreign_key: 'clinic_id'

  #mount_uploader :adr_map, AttachmentUploader
  mount_uploader :avatar, AttachmentUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
