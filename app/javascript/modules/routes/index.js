export const mainRoutes = [
    {
        path:'/',
        name: 'Main',
        component: () => import('@/modules/pages/Main.vue')
    },
    {
        path:'/stays/:id',
        name: 'Stays',
        component: () => import('@/modules/pages/Stays.vue')
    }
]