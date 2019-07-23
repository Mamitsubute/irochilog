class PosessionMonster < ApplicationRecord
  belongs_to :user
  belongs_to :pocket_monster
end
