class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester
      t.string  :invitee
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
