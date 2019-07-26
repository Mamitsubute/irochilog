class CreateUserConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_configs do |t|
      t.integer :sort_key, default: 0, null: false
      t.string :user_name

      t.timestamps
    end
  end
end
