<template>
  <div id="home">
    <div class="content">
    <v-select
      :items="sort_keys"
      label="Standard"
    ></v-select>
        <v-layout rou wrap>
          <v-flex xs6 md4 xl3 v-for="pokemon in pokemons" :key="pokemon.id">
            <v-card
              class="mx-auto"
              :flat="flat"
              :loading="loading"
              :width="width"
              :height="height"

            >
              <v-img height="200px" width="200px" v-bind:src="pokemon.image_url">
              </v-img>
              <v-card-text>{{pokemon.name}}</v-card-text>
                <v-btn icon>
                  <v-icon>share</v-icon>
                </v-btn>
                <v-btn icon>
                  <v-icon>bookmark</v-icon>
                </v-btn>
            </v-card>
          </v-flex>
        </v-layout>
    </div>

  </div>

</template>


<script>
  var axios = require('axios')
  export default{
    data() {
      return {
        loading: true,
        totalPokemons: 0,
        pokemons: [],
        sort_keys: []
      };
    },
    watch: {
      options: {
        handler () {
          axios.get('pokemons/').then(function (res){
            console.log(res.data.list.monsters);
            self.pokemons = res.data.list.monsters;
            self.sort_keys = res.data.list.sort_keys;
          });
        },
        deep: true,
      },
    },
    mounted() {
      const self = this;
      axios.get('pokemons/').then(function (res){
        console.log(res.data.list.monsters);
        self.pokemons = res.data.list.monsters;
        self.sort_keys = res.data.list.sort_keys.map(function(a){ return a.name});
      });
    },
  }
</script>
