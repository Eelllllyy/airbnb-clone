import { defineStore } from 'pinia'
import axios from 'axios'
import VueCookies from 'vue-cookies'
export const useStoreAuth = defineStore({
  id: 'auth',
  state: () => ({
    login: '',
    email: '',
    password: '',
    error: '',
    errors:'',
    token: null,
    isAuth: false,
    name: '',
    passwordRepeat: '',

    //for navbar
    searchOpen: false,
    searchClose: true,
    loginOpen: false,
    logOutOpen: false,
    dialogLogin: false,
    dialogSignUp: false,
  }),
  actions: {
    async handleSubmit() {
      try {
        const response = await axios.post('/api/session', {
          email: this.email,
          password: this.password,
        })
        this.token = response.data.access
        VueCookies.set('token', response.data.access, 60, null, null, true)
        this.email = ''
        this.error = ''
        this.password = ''
        this.passwordRepeat = ''
        this.dialogLogin = false
        this.isAuth = true
      } catch ({ response }) {
        this.error = response.data.error
      }
    },
    async createUser() {
      try {
        const response = await axios.post('/api/registration', {
          name: this.name,
          email: this.email,
          password: this.password,
        })
        VueCookies.set('token', response.data.access, 60, null, null, true)
        ;(this.password = ''), (this.name = ''), (this.email = ''), (this.errors = ''), 
        this.dialogSignUp = false, this.dialogLogin = false, this.passwordRepeat = ''
      } catch ({ response }) {
        this.errors = response.data.errors.full_messages
      }
    },
    async deleteSession() {
      try {
        const response = await axios.delete('/api/client/session', {
          headers: {
            Authorization: VueCookies.get('token'),
          },
        })
        this.token = null
        this.isAuth = false
        VueCookies.remove('token')
      } catch ({ response }) {
        console.error(response)
      }
    },
  },
})

export const useStoreImages = defineStore({
    id: 'images',
    state: () => ({
      location: '',
      name: '',
      price:'',
      rating:'',
      cards:null,
      page:1,
      items:10,
      totalPages:0,
      search:''
    }),
    actions:{
      async getCards() {
        try{
          const response = await axios.get('/api/stays',{
            params:{
              page: this.page,
              items: this.items,
              search: this.search
            }
          })
          this.totalPages = response.headers['total-pages']
          this.page = response.headers['current-page']
          this.cards = response.data
        }catch({response}){
          console.error(response)
        }
      },
      async loadMoreCards(){
        try{
          
          const response = await axios.get('/api/stays',{
            params:{
              page: parseInt(this.page) + 1,
              items: this.items
            }
          })
          this.page = response.headers['current-page']
          this.totalPages = response.headers['total-pages']
          this.cards.push(...response.data)
          
          // this.cards = [...this.cards,...response.data]
        }catch({response}){
          console.error(response)
        }
      }
    },
    
})

