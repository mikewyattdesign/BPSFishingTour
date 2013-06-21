class AddAttachmentTeamPictureToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :team_picture
    end
  end

  def self.down
    drop_attached_file :teams, :team_picture
  end
end
