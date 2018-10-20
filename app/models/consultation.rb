class Consultation < ApplicationRecord
  belongs_to :clinique, foreign_key: "client_clinique_id"
  belongs_to :duty


  def client_clinique
    self.client_clinique_id.nil? ? Clinique.find(1) : Clinique.find(self.client_clinique_id)
  end
end
