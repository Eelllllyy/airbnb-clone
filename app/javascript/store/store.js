import {defineStore} from 'pinia'

export const useStoreAuth = defineStore({
    id: 'auth',
    state: () => ({
        test: 21
    })
})

export const useStoreNavbar = defineStore({
    id: 'navbar',
    state: () => ({
        searchOpen: false,
        searchClose:true,
        loginOpen:false
    }),

})