class CreatePosessionMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :posession_monsters do |t|
      t.references :user, foreign_key: true
      t.references :pocket_monster, foreign_key: true
      t.integer :posession_amount

      t.timestamps
    end
  end
end
