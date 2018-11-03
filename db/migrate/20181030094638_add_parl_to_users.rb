class AddParlToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :parl, :boolean, default: false, null: false
  end
end
