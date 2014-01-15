class AddShortdescriptionAndPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shortdescription, :text
    add_column :users, :phone, :string
  end
end
