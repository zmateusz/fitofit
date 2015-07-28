class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.text :description
      t.float :distance
      t.string :location_a
      t.string :location_b

      t.timestamps null: false
    end
  end
end
