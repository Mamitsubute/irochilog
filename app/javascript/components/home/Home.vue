<template>
  <div id="home">
    <div class="content">

    <v-select
      :items="sort_keys"
      label="Standard"
    ></v-select>

    <ul>
      <li v-for="pokemon in pokemons">
        {{pokemon.name}}
        
      </li>
      </ul>
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
        headers: [
          {
            text: 'なまえ',
            value: 'name',
          },
          {text: 'test',
          value: 'num'}
        ],
        //pokemons:[{num: 5, name: 'piyo'},{num: 5, name: 'piyo'},{num: 5, name: 'piyo'},{num: 5, name: 'piyo'},{num: 5, name: 'piyo'},{num: 5, name: 'hoge'}, {num: 5, name: 'huga'}, {num: 5, name: 'piyo'},]
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
//    created(){
//      axios.get('pokemons/').then(function (res){
//        console.log(res.data.list.monsters);
//        self.pokemons = res.data.list.monsters;
//        self.pokemons = [
//        {name: 'hogehoge'},
//        {name: 'hugahuga'},
//        ]
//      });
//    },
  }
</script>
