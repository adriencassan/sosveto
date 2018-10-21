class InitateTables < ActiveRecord::Migration[5.1]
 def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :adr_line1
      t.string :adr_line2
      t.string :adr_zip
      t.string :adr_city
      t.string :adr_country
      t.string :adr_map
      t.string :phone
      t.string :email
      t.string :role
      t.string :avatar
      t.boolean :admin
      t.references :user, index: true, foreign_key: true
      t.references :clinic, index: true, foreign_key: {to_table: :profiles}

      # FOR CLIENT
      t.string :client_gender

      # FOR PET
      t.string :pet_specie
      t.string :pet_gender
      t.integer :pet_age
      t.references :pet_clinic, index: true, foreign_key: {to_table: :profiles}

      t.timestamps
    end

    create_table :duties do |t|
      t.date :date_start
      t.date :date_end
      t.string :title
      t.references :clinic, index: true, foreign_key: {to_table: :profiles}
      t.timestamps
    end

    create_table :consultations do |t|
      t.references :duty, foreign_key: true
      t.references :pet, index: true, foreign_key: {to_table: :profiles}
      t.string :client_nom
      t.string :client_adresse
      t.string :client_ville
      t.string :client_telephone
      t.string :client_mail
      t.string :consultation_motif
      t.string :consultation_commentaires
      t.string :consultation_suites
      t.string :report
      t.string :statut_envoi, default: "Non-envoyée"
      t.timestamps
    end

    create_table :events do |t|
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
