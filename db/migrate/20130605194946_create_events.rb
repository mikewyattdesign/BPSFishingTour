class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :province
      t.string :state
      t.string :country
      t.string :postal_code
      t.datetime :date

      t.timestamps
    end
  end
end


