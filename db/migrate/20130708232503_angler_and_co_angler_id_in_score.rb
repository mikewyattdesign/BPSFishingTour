class AnglerAndCoAnglerIdInScore < ActiveRecord::Migration
    def change
        add_column :scores, :angler_id, :integer
        add_column :scores, :co_angler_id, :integer
    end
end
