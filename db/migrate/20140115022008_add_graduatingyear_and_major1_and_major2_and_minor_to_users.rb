class AddGraduatingyearAndMajor1AndMajor2AndMinorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :graduatingyear, :string
    add_column :users, :major1, :string
    add_column :users, :major2, :string
    add_column :users, :minor, :string
  end
end
