class CreateCliniques < ActiveRecord::Migration[5.1]
  def change
    create_table :cliniques do |t|
      t.string :nom
      t.string :veterinaires
      t.string :mail
      t.timestamps
    end
  end
end
