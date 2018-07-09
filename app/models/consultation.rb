class Consultation < ApplicationRecord
  belongs_to :clinique, foreign_key: "client_clinique_id"
  belongs_to :garde


  def client_clinique
    Clinique.find(self.client_clinique_id)
  end
end
