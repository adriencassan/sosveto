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
      t.string :pet_breed
      t.string :pet_gender
      t.string :pet_colour
      t.date :pet_birth
      t.boolean :pet_is_sterilized
      t.boolean :pet_is_mixed_breed
      t.boolean :pet_is_lof
      t.boolean :pet_is_vaccinated
      t.references :pet_owner, index: true, foreign_key: {to_table: :profiles}

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
      t.references :client, index: true, foreign_key: {to_table: :profiles}

      t.datetime :date, default: -> { 'CURRENT_TIMESTAMP' }

      t.string :comment_reason
      t.string :comment_description
      t.string :comment_treatment
      t.string :comment_next_step

      t.numeric :pet_weight, default: 0
      t.numeric :pet_temperature, default: 0
      t.string :pet_appetite, default: "NC"
      t.string :pet_thirst, default: "NC"
      t.string :pet_condition, default: "NC"
      t.string :pet_mucosa, default: "NC"
      t.string :pet_heart_rate, default: "NC"
      t.string :pet_dehydration, default: "NC"

      t.string :report
      t.string :report_status, default: "Non-envoyée"
      t.timestamps
    end

    create_table :events do |t|
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
