class PokemonsController < ApplicationController
  include Sort
  before_action :authenticate_user!

  # GET /pokemons
  def index
    sort_key = params[:sort] || :name_asc
    @pokemons = PocketMonster
                  .includes(:types)
                  .joins(:types)
                  .order("pokedex_number asc")

    ret = {
      list: {
        sort_key: translate_sort_key(sort_key),
        monsters: get_pokemon_list(@pokemons),
        sort_keys: get_sort_keys(),
      },
    }
    render json: ret
  end

  # GET /pokemons/1
  def show
    @pokemon = PocketMonster.find(params[:id])
    @pm = PosessionMonster
            .where(:user_id => current_user.id)
            .where(:pocket_monster_id => @pokemon.id)

    render json: {
      info: {
        monster: {
          name: @pokemon.pokemon_name,
          posession_amount: @pm.present? ? @pm.posession_amount : 0,
          get_place: @pm.present? ? @pm.get_place : '',
          get_date: @pm.present? ? @pm.get_date : ''
        }
      }
    }
  end

  # no CREATE method, user mustnot create original pokemon.

  def update
    pokemon_id = params[:id]
    pokemon = PocketMonster.find(pokemon_id)
    shiny = params[:shiny] | false
    target_table = shiny ? ShinyPosessionMonster : PosessionMonster
    if pokemon.present?
      posession = target_table
                .where("pocket_monster_id = ?", pokemon.id)
                .where("user_id = ?", current_user.id)
      unless posession.present?
        target_table.new(
          :user_id => current_user.id,
          :pocket_monster_id => pokemon.id,
          :posession_amount => 1
        ).save
      end
    end
  end

  def destroy
    pokemon_id = params[:id]
    pokemon = PocketMonster.find(pokemon_id)
    shiny = params[:shiny] | false
    target_table = shiny ? ShinyPosessionMonster : PosessionMonster
    if pokemon.present?
      posession = target_table
                .where("pocket_monster_id = ?", pokemon.id)
                .where("user_id = ?", current_user.id)
      if posession.present?
        posession.destroy!
      end
    end
  end

  private
  def get_pokemon_list(pokemons)
    user_id = current_user.id
    ret = []
    pm_ids = PosessionMonster
            .select(:user_id, :pocket_monster_id)
            .where(:user_id => user_id)
            .pluck(:pocket_monster_id)
    spm_ids = ShinyPosessionMonster
            .select(:user_id, :pocket_monster_id)
            .where(:user_id => user_id)
            .pluck(:pocket_monster_id)
    pokemons.each do |mon|
      ret.push({
        :name => mon.pokemon_name,
        :type => mon.types.pluck(:type_name),
        :normal => pm_ids[mon.id].present?,
        :irochi => spm_ids[mon.id].present?,
        :image_url => mon.image_url
      })
    end
    ret
  end

  def get_sort_keys
    ret = []
    UserConfig.sort_keys.each do| k, v | 
      ret.append({
        :name => I18n.t("sort_key.#{k}"),
        :key => k.to_s
      })
    end
    return ret
  end
end
