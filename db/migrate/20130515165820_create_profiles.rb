class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :suite
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :ext
      t.string :shirt
      t.string :outdoor_rewards_number

      t.timestamps
    end
  end
end
