<template>
  <div>
    <div>
      <section 
        class="section"
        @click.capture="(returnLabelfor('email') || returnLabelfor('name') || returnLabelfor('password') || returnLabelfor('passwordRepeat'))"
      >
        <header class="block-header">
          <button
            class="cross"
            @click="closeAndReset"
          />
          <div class="block-for-text">
            <h4 class="text-header">
              Log in or sign up
            </h4>            
          </div>
          <div class="line-gray" />
        </header>
        <main class="block-main">
          <h2 class="greetings">
            Welcome to Airbnb
          </h2>
          <form
            class="form"
            @submit.prevent="toContinue"
          >
            <div
              class="input-content"
              @click.stop="moveLabelFor('email')"
              @keyup="moveLabelFor('email')"
            >
              <label
                class="label email"
                :class="{'move-label': isActiveLabelEmail}"
              >Email</label>
              <input
                v-model="storeAuth.email"
                class="input border-radius-top"
              > 
            </div>
            <div
              v-if="storeAuth.dialogSignUp"
              class="input-content"
              @click="moveLabelFor('name')"
              @keyup="moveLabelFor('name')"
            >
              <label
                class="label name"
                :class="{'move-label': isActiveLabelName}"
              >Name</label>
              <input
                v-model="storeAuth.name"
                class="input"
              >
            </div>
            <div
              class="input-content"
              @click.stop="moveLabelFor('password')"
              @keyup="moveLabelFor('password')"
            >
              <label
                class="label password"
                :class="{'move-label': isActiveLabelPassword}"
              >Password</label>
              <input
                v-model="storeAuth.password"
                type="password"
                class="input "
                :class="{'border-radius-bottom' : !storeAuth.dialogSignUp }"
              >
            </div>
            <div
              v-if="storeAuth.dialogSignUp"
              class="input-content"
              @click="moveLabelFor('passwordRepeat')"
              @keyup="moveLabelFor('passwordRepeat')"
            >
              <label
                class="label password-repeat"
                :class="{'move-label': isActiveLabelPasswordRepeat}"
              >Password Repeat</label>
              <input
                v-model="storeAuth.passwordRepeat"
                type="password"
                class="input border-radius-bottom"
              >
            </div>
            <p
              v-if="storeAuth.error"
              class="error"
            >
              {{ storeAuth.error }}
            </p>
            <div v-if="(storeAuth.dialogLogin === true && storeAuth.dialogSignUp === false) ">
              <p class="privacy-policy">
                We’ll call or text you to confirm your number. Standard message and data rates apply.
              </p><h5 class="text-underline">
                Privacy Policy
              </h5>
              </p>
            </div>
            <div>
              <button
                class="btn"
                type="submit"
              >
                Continue
              </button>
            </div>
          </form>
        </main>
      </section>
    </div>
  </div>
</template>
<script setup>
import { useStoreAuth } from '@/store/store'
import { ref } from 'vue'

const storeAuth = useStoreAuth()

const isActiveLabelEmail = ref(false)
const isActiveLabelPassword = ref(false)
const isActiveLabelPasswordRepeat = ref(false)
const isActiveLabelName = ref(false)

const toContinue = async() => {
  if(storeAuth.dialogSignUp){
    await storeAuth.createUser()
  }
  else{
    await storeAuth.handleSubmit()
  }
}
const moveLabelFor = (name) => {
  switch(name){
    case 'email': isActiveLabelEmail.value = true; break
    case 'name': isActiveLabelName.value = true;break
    case 'password': isActiveLabelPassword.value = true;break
    case 'passwordRepeat': isActiveLabelPasswordRepeat.value = true;break
  }
}
const returnLabelfor = (name) => {
  switch(name){
    case 'email': if (storeAuth.email === '') return isActiveLabelEmail.value = false
    case 'name':  if (storeAuth.name === '') return isActiveLabelName.value = false
    case 'password': if (storeAuth.password === '') return isActiveLabelPassword.value = false
    case 'passwordRepeat': if (storeAuth.passwordRepeat === '') return isActiveLabelPasswordRepeat.value = false
  }
}

const closeAndReset = () => {
  storeAuth.dialogSignUp = false
  storeAuth.dialogLogin = false
  storeAuth.email = ''
  storeAuth.password = ''
  storeAuth.passwordRepeat = ''
  storeAuth.name = ''
  storeAuth.error = ''
}
</script>
<style scoped>
.section{
  position: fixed;
  max-width: 500px;
  left: 33.56%;
  right: 33.56%;
  top: 218px;
  padding: 10px 0;
  background: #FFFFFF;
  box-shadow: 0px 8px 28px rgba(0, 0, 0, 0.28);
  border-radius: 12px;
}
.block-header{
  position: relative;
}
.block-main{
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  padding: 20px;
}
.cross{
  background-image: url('../../../assets/img/cross.svg');
  width: 16px;
  height: 16px;
  position: absolute;
  top: 11px;
  left: 19px;
  cursor: pointer;
  border:none;
  background-color: white;
}
.block-for-text{
  display: flex;
  justify-content: space-around;
}
.text-header{
  padding: 9px 10px;
  display: inline-block;
}
.input{
  background: #FFFFFF;
  font-size: 16px;
  width: 100%;
  height: 55px;;
  border: 1px solid rgba(128, 128, 128, 0.274);
  padding: 7px 0px 0 10px;
}
.border-radius-top{
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}
.border-radius-bottom {
  border-bottom-left-radius: 8px;
  border-bottom-right-radius: 8px;
  margin-bottom:20px
}
.btn{
  width: 100%;
  height: 48px;
  color: white;
  font: 600 15px / 30px 'Roboto'; 
  background: linear-gradient(90deg, #E61E4D 0%, #E31C5F 50%, #D70466 100%);
  border-radius: 8px;
  border: none;
  cursor: pointer;
}
.line-gray{
  border-bottom: 1px solid rgba(128, 128, 128, 0.274);
  margin:10px 0 6px 0;
}

.input-content{
  position: relative;
}
.label{
  color: #717171;
  position: absolute;
  top: 20px;
  left: 21px;
  transition-timing-function: ease-in-out;
  transition-duration: 0.3s;
}
.move-label{
  transform: translate(-11px,-11px);
  font-size: 12px;
  transition-timing-function: ease-in-out;
  transition-duration: 0.3s;
}
.error{
  margin-bottom: 20px;
  color:red
}
.privacy-policy{
  font-size: 12px;
  padding-bottom: 20px;
}
.text-underline{
  text-decoration:underline;
  cursor: pointer;
  display: inline;
}
.greetings{
  margin-bottom:20px
}

</style>
