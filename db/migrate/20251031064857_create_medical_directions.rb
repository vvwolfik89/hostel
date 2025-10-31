class CreateMedicalDirections < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_directions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
