class PokemonsController < ApplicationController
  #before_action :authenticate_user!

  # GET /pokemons
  def index
    @pokemons = PocketMonster
                  .includes(:types)
                  .joins(:types)
                  .order("pokedex_number asc")

    ret = {
      list: {
        sort_key: "desc",
        monsters: self.get_pokemon_list(@pokemons)
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

  def get_pokemon_list(pokemons)
    user_id = current_user.id
    ret = []
    pokemons.each do |mon|
      pm = PosessionMonster
              .where(:user_id => user_id)
              .where(:pocket_monster_id => mon.id)
      ret.push({
        :name => mon.pokemon_name,
        :type => mon.types.pluck(:type_name),
        :normal => pm.present? ? pm.normal : false,
        :irochi => pm.present? ? pm.irochi : false,
        :image_url => mon.image_url
      })
    end
    ret
  end
end
