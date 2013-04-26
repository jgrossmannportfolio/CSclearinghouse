class CreateTagsUsersTable < ActiveRecord::Migration
  def up
		create_table :tags_users, :id => false do |t|
			t.integer :tag_id
			t.integer :user_id
		end
  end

  def down
		drop_table :tags_users
  end
end
