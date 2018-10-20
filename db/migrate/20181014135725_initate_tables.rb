class InitateTables < ActiveRecord::Migration[5.1]
 def change
    create_table :cliniques do |t|
      t.string :nom
      t.string :adr_street
      t.string :adr_zip
      t.string :adr_ville
      t.string :adr_pays
      t.string :telephone
      t.string :email
      t.string :avatar
      t.string :veterinaires
      t.timestamps
    end

    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :adr_street
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
      t.references :clinic, index: true, foreign_key: true
      t.timestamps
    end

    create_table :gardes do |t|
      t.string :titre
      t.references :clinique, index: true, foreign_key: true
      t.timestamps
    end

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

    create_table :events do |t|
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
