class AddContactPreferenceToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :contact_preference, :string
  end
end
