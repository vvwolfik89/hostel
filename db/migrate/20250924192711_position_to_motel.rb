class PositionToMotel < ActiveRecord::Migration[7.1]
  def change
    add_column :motels, :position, :string
    add_column :motels, :latitude, :float
    add_column :motels, :longitude, :float
  end
end
