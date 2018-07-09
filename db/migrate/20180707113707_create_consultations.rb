class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.references :garde, foreign_key: true
      t.string :client_nom
      t.string :client_adresse
      t.string :client_ville
      t.string :client_telephone
      t.string :client_mail
      t.references :client_clinique, index: true, foreign_key: {to_table: :cliniques}
      t.string :animal_nom
      t.string :animal_espece
      t.integer :animal_ageA
      t.integer :animal_ageM
      t.string :animal_sexe
      t.string :consultation_motif
      t.string :consultation_commentaires
      t.string :consultation_suites
      t.string :statut_envoi, default: "Non-envoyée"
      t.timestamps
    end
  end
end
