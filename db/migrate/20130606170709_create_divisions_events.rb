class CreateDivisionsEvents < ActiveRecord::Migration
  def change
    create_table :divisions_events do |t|
      t.integer :event_id
      t.integer :division_id

      t.timestamps
    end
  end
end
