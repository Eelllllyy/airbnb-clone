import { createApp } from 'vue'
import router from '@/router'
import { createPinia } from 'pinia'
import App from '../App.vue'
import VueCookies from 'vue-cookies'
import '../assets/styles/application.css'

const app = createApp(App)
app.use(router)
app.use(createPinia())
app.use(VueCookies)
app.mount('#app')
