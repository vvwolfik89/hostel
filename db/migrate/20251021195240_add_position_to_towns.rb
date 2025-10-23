class AddPositionToTowns < ActiveRecord::Migration[7.1]
  def change
    add_column :towns, :position, :string
    add_column :towns, :latitude, :float
    add_column :towns, :longitude, :float
  end
end
