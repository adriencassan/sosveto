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

  def age_in_string
    return "Age non-communiqué" if pet_birth.nil?
    age_in_months = (Date.today.year * 12 + Date.today.month) - (pet_birth.year * 12 + pet_birth.month)

    if age_in_months <= 18
      "#{age_in_months} mois"
    elsif age_in_months < 24
      "#{(age_in_months/12).floor} an et #{age_in_months%12} mois"
    else
      "#{(age_in_months/12).floor} ans et #{age_in_months%12} mois"
    end
  end
end
