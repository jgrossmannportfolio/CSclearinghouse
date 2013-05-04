class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type
      t.string :message
			t.integer :user_id
			t.integer :project_id
			t.string :admin_type
			t.string :subject
			t.string :from

      t.timestamps
    end
  end
end
