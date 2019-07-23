import Vue from 'vue'
import Vuetify from 'vuetify'
import App from '../baselineFlipped.vue'

Vue.use(Vuetify)

document.addEventListener('DOMContentLoaded', () => {
	  const app = new Vue({
		      render: h => h(App)
		    }).$mount()
	  document.body.appendChild(app.$el)

	  console.log(app)
})
