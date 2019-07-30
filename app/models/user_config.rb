class UserConfig < ApplicationRecord

  enum sort_key: { name_asc: 0,
       name_dsc: 1,
       own: 2,
       not_own: 3,
       pokedex_asc: 4,
       pokedex_dsc: 5,
       get_date_asc: 6,
       get_date_dsc: 7  }
end
