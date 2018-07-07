class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.references :clinique, foreign_key: true
      t.string :client_name
      t.string :client_adresse
      t.string :client_mail
      t.string :animal_name
      t.string :animal_race
      t.integer :animal_ageA
      t.integer :animal_ageM
      t.string :animal_sexe
      t.string :consultation_motif
      t.string :consultation_commentaires
      t.string :consultation_ttm
      t.string :consultation_next
      t.string :consultation_etat_general
      t.string :consultation_etat_appetit
      t.timestamps
    end
  end
end
