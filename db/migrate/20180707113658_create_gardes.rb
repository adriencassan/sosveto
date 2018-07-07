class CreateGardes < ActiveRecord::Migration[5.1]
  def change
    create_table :gardes do |t|
      t.string :titre
      t.timestamps
    end
  end
end
