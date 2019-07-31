<template>
  <div id="home">
  <v-data-table
    :headers="headers"
    :items="pokemons"
    :items-per-page="5"
    class="elevation-1"
  ></v-data-table>
  </div>

</template>


<script>
  export default{
    data(){
      return {
        pokemons:[]
      };
    },
    created(){
      axios.get('https://qiita.com/api/v2/items?page=1&per_page=20').then(function (res){
        this.pokemons = res.data;
      });
    },
  }
</script>