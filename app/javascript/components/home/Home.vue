<template>
  <div id="home">
    <div class="content">
 
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
        pokemons: []
      };
    },
    watch: {
      options: {
        handler () {
          axios.get('pokemons/').then(function (res){
            console.log(res.data.list.monsters);
            self.pokemons = res.data.list.monsters;
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
