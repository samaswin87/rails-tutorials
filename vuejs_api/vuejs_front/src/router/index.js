import Vue from 'vue'
import Router from 'vue-router'
import Signin from '@/components/Signin.vue'
Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'SignedIn',
      component: Signin
    }
  ]
})
