class Consultation < ApplicationRecord
  belongs_to :duty
  belongs_to :client, class_name: "Profile"
  belongs_to :pet, class_name: "Profile"

   mount_uploader :report, AttachmentUploader
   accepts_nested_attributes_for :client, reject_if: :all_blank, allow_destroy: true
   accepts_nested_attributes_for :pet, reject_if: :all_blank, allow_destroy: true
  #def client_clinique
  #  self.client_clinique_id.nil? ? Clinique.find(1) : Clinique.find(self.client_clinique_id)
  #end
end
