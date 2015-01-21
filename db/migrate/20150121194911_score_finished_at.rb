class ScoreFinishedAt < ActiveRecord::Migration
  def change
    add_column :scores, :finished_at, :timestamp
    reversible do |dir|
      dir.up do
        execute "UPDATE scores set finished_at = current_timestamp"
      end
    end

  end
end
