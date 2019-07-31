import Vue from 'vue'
import Vuetify from 'vuetify'
import App from '../baselineFlipped.vue'
import "vuetify/dist/vuetify.min.css"
import axios from 'axios'
import router from '../router/router.js'

Vue.use(Vuetify)
Vue.prototype.$axios = axios;


document.addEventListener('DOMContentLoaded', () => {
	  const app = new Vue({
			  render: h => h(App),
			  router:router,
		    }).$mount()
	  document.body.appendChild(app.$el)

	  console.log(app)
})
