class PocketMonster < ApplicationRecord
  has_many :pocket_monster_types
  has_many :posession_monsters
  has_many :types, through: :pocket_monster_types
end
