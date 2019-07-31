<template>
  <div id="home">
    <div class="content">
 
    <ul>
      <li v-for="pokemon in pokemons">
        <img v-bind:src="pokemon.image_url">
        {{pokemon.name}}
        {{pokemon.type}}        
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
  }
</script>
