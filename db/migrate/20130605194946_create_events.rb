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
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
