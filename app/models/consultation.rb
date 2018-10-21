class Consultation < ApplicationRecord
  belongs_to :duty

   mount_uploader :report, AttachmentUploader
  #def client_clinique
  #  self.client_clinique_id.nil? ? Clinique.find(1) : Clinique.find(self.client_clinique_id)
  #end
end
