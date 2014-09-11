class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score_id
      t.integer :metric_id
      t.integer :rating

      t.timestamps
    end
  end
end
