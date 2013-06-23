class AddBoatDesriptionAndFavoriteGearToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :boat_description, :text
    add_column :teams, :favorite_gear, :text
  end
end
