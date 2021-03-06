class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer     :requester
      t.string      :invitee_email
      t.integer     :invitee_id
      t.boolean     :accepted,  default: false
      t.boolean     :denied,    default: false
      t.datetime    :replied_at

      t.timestamps
    end
  end
end
