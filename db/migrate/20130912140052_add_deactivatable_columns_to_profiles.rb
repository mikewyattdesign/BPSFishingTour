class AddDeactivatableColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :deactivated_at, :datetime
  end
end
