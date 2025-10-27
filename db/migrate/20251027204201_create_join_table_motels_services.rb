class CreateJoinTableMotelsServices < ActiveRecord::Migration[7.1]
  def change
    create_join_table :motels, :services do |t|
      t.index [:motel_id, :service_id]
      t.index [:service_id, :motel_id]
    end
  end
end
