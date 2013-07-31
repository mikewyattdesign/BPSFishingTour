class AddTeamRefToScores < ActiveRecord::Migration
  def change
    add_reference :scores, :team, index: true
  end
end
