class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string 'title'
      t.text 'description'
      t.string 'owner'
      t.string 'deadline'
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
