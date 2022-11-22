import {defineStore} from 'pinia'
import axios from 'axios'
import VueCookies from 'vue-cookies'
export const useStoreAuth = defineStore({
id: 'auth',
state: () => ({
  login:'',
  email:'',
  password:'',
  error:'',
  token:null,
  isAuth:false,
  name:'',
  passwordRepeat:'',

  //for navbar
  searchOpen: false,
  searchClose:true,
  loginOpen:false,
  logOutOpen:false,
  dialogLogin:false,
  dialogSignUp:false

}),
actions: {
async handleSubmit(){
  try{
    const response = await axios.post('/api/session',{
    email: this.email,
    password:this.password
    });
    console.log(response)
    this.token = response.data.access

    VueCookies.set('token', response.data.access, 60, null, null, true)
    this.email='';
    this.password='';
    this.dialogLogin = false;
    this.isAuth = true
            
  }
    
  catch({response}){
  this.error = response.data.error
  }
},
async createUser() {
  try {
    const response = await axios.post('/api/registration', {
    name: this.name,
    email: this.email,
    password: this.password
    });
    this.password = '',
    this.name = '',
    this.email= '',
    this.error= '',
    this.dialogLogin = true;
    this.dialogSignUp = false
    console.log(response)
  } catch ({response}) {
    this.error = response.data.error
  }
},
async deleteSession () {
  try{
    const response = await axios.delete('/api/client/session',{
      headers: {
        Authorization: VueCookies.get('token'),
      },
    })
    this.token = null
    this.isAuth = false
    VueCookies.remove('token')
  }catch(e){
    console.error(e)
  }
}

}
})

// export const useStoreNavbar = defineStore({
//     id: 'navbar',
//     state: () => ({
//         searchOpen: false,
//         searchClose:true,
//         loginOpen:false,
//         dialogLogin:false,
//         dialogSignUp:false
//     }),

// })