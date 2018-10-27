class CreateMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :maps do |t|
      t.string :pref_name
      t.integer :user_id
      t.string :pref_info

      t.timestamps
    end
  end
end
