class CreatePocketMonsterTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pocket_monster_types do |t|
      t.references :pocket_monster, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
