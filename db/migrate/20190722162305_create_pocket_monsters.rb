class CreatePocketMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :pocket_monsters do |t|
      t.integer :pokedex_number
      t.string :pokemon_name
      t.string :image_url

      t.timestamps
    end
  end
end
