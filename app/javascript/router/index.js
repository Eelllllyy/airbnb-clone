import { createRouter, createWebHistory } from 'vue-router'
import { mainRoutes } from '@/modules/routes'

const routes = [...mainRoutes]

const router = createRouter({
  routes,
  history: createWebHistory(),
})

export default router
