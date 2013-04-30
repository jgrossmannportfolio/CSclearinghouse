class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type
      t.string :message
			t.integer :user_id

      t.timestamps
    end
  end
end
