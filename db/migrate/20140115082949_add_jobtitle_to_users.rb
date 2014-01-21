class AddJobtitleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jobtitle, :string
  end
end
