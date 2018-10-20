class Profile < ApplicationRecord
  belongs_to :user

  belongs_to :clinic, class_name: "Profile"
  has_many :profile, class_name: "Profile", foreign_key: 'clinic_id'

  #mount_uploader :adr_map, AttachmentUploader
  mount_uploader :avatar, AttachmentUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
