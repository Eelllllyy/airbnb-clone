export const mainRoutes = [
    {
        path:'/',
        name: 'Main',
        component: () => import('@/modules/pages/Main.vue')
    },
    {
        path:'/lodging',
        name: 'Lodging',
        component: () => import('@/modules/pages/Lodging.vue')
    }
]