<template>
  <v-app id="inspire" dark>
    <v-navigation-drawer
      v-model="drawer"
      fixed
      clipped
      app
    >
      <v-list dense>
        <router-link tag="li" to="/">
        <v-list-tile @click="">
          <v-list-tile-action>
            <v-icon>home</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Home</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        </router-link>
        <router-link tag="li" to="/settings">
        <v-list-tile @click="">
          <v-list-tile-action>
            <v-icon>contact_mail</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Setting</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        </router-link>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar app fixed clipped-left>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Irochi Log</v-toolbar-title>
    <v-spacer></v-spacer>
      <v-btn color="darkblue" href="/users/sign_out">
        <v-icon dark>logout</v-icon>
      </v-btn>
    </v-toolbar>
    <v-content>
      <router-view class="router-view"></router-view>
    </v-content>
  </v-app>
</template>


<script>
import Home from 'components/home/Home'
  export default {
    name: 'App',
    components:{
      Home
    },
    data: () => ({
      drawer: null
    }),

    props: {
      source: String
    }
  }
</script>
