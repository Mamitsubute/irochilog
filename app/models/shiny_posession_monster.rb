class ShinyPosessionMonster < ApplicationRecord
  belongs_to :user
  belongs_to :pocket_monster
end
