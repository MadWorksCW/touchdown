class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.timestamp :opened_at
      t.timestamp :closed_at

      t.timestamps
    end
    add_column :questions, :application_id, :integer
    add_column :responses, :application_id, :integer
    add_column :metrics, :application_id, :integer

    reversible do |dir|
      dir.up do
        application = Application.create(name: "Madworks Accelerator Fall 2014", opened_at: 6.months.ago, closed_at: 5.months.ago)
        execute "update questions set application_id = #{application.id}"
        execute "update responses set application_id = #{application.id}"
        execute "update metrics set application_id = #{application.id}"
      end
    end
  end
end
