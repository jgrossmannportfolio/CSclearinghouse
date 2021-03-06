class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string 'title'
      t.text 'description'
      t.string 'owner'
      t.datetime :confirmed_at
      t.date 'deadline'

      t.timestamps
    end
  end
end
