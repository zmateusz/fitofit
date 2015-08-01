class AddUserToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :user, index: true
    add_foreign_key :tracks, :users
    change_column :tracks, :description, :text, null: false, default: "---"
  end
end
