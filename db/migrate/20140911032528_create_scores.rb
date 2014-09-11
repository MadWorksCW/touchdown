class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.uuid :response_id
      t.text :comments

      t.timestamps
    end
  end
end
