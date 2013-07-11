class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :event_id
      t.integer :position
      t.string :angler
      t.string :angler_rewards
      t.string :co_angler
      t.string :co_angler_rewards
      t.decimal :weight
      t.decimal :bf
      t.decimal :hp

      t.timestamps
    end
  end
end
