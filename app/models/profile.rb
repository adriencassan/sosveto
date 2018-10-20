class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :adr_map, AttachmentUploader
  mount_uploader :avatar, AttachmentUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
