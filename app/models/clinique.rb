class Clinique < ApplicationRecord
  has_many :consultations, foreign_key: "client_clinique_id"
end
