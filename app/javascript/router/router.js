import Vue from 'vue'
import Router from 'vue-router'
import Home from '../components/home/Home.vue'
import Setting from '../components/setting/Setting.vue'

Vue.use(Router)

export default new Router({
    routes: [
        {
            path:'/',
            component:Home
        },
        {
            path:'/settings',
            component:Setting
        }
    ]
})