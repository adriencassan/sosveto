class Profile < ApplicationRecord
  belongs_to :user, optional: true

  # DOCTORS + CLIENTS
  belongs_to :clinic, class_name: 'Profile', optional: true

  # CLIENTS
  belongs_to :clinic, class_name: 'Profile', optional: true
  has_many :consultations, foreign_key: 'client_id'

  # CLINIQUE
  has_many :duties, foreign_key: 'clinic_id'
  #has_many :consultations, foreign_key: 'clinic_id'
  has_many :profiles, foreign_key: 'clinic_id'

  # PETS
  belongs_to :pet_owner, class_name: 'Profile', optional: true
  has_many :profiles, foreign_key: 'pet_owner_id'
  has_many :consultations, foreign_key: 'pet_id'


  #mount_uploader :adr_map, AttachmentUploader
  mount_uploader :avatar, AttachmentUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
