class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string 'title'
      t.text 'description'
      t.string 'owner'
      t.string 'deadline'
      t.timestamps
    end
  end
end
