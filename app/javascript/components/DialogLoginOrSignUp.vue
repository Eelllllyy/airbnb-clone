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
            novalidate="true"
            class="form"
            @submit.prevent="loginOrSignUp"
          >
            <div
              class="input-content"
              @click.stop="moveLabelFor('email')"
              @keyup="moveLabelFor('email')"
            >
              <label
                class="label email"
                :class="{'move-label': isActiveLabelEmail, 'label-error': validateError || lenEmailError}"
              >Email</label>
              <input
                v-model="storeAuth.email"
                type:email
                required
                class="input border-radius-top"
                :class="{'red-border': storeAuth.errors[2] || storeAuth.error || validateError || lenEmailError}"
              > 
              <div
                v-if="validateError"
                class="errors"
              >
                Email entered incorrectly
              </div>
              <div
                v-if="lenEmailError"
                class="errors"
              >
                Email is blank
              </div>
              <div class="errors">
                {{ storeAuth.errors[2] }}
              </div>
            </div>
            <div
              v-if="storeAuth.dialogSignUp"
              class="input-content"
              @click="moveLabelFor('name')"
              @keyup="moveLabelFor('name')"
            >
              <label
                class="label name"
                :class="{'move-label': isActiveLabelName, 'label-error': lenNameError}"
              >Name</label>
              <input
                v-model="storeAuth.name"
                required
                class="input"
                :class="{'red-border': storeAuth.errors[1] || lenNameError}"
              >
              <div
                v-if="lenNameError"
                class="errors"
              >
                Name is blank
              </div>
              <div class="errors">
                {{ storeAuth.errors[1] }}
              </div>
            </div>
            <div
              class="input-content"
              @click.stop="moveLabelFor('password')"
              @keyup="moveLabelFor('password')"
            >
              <label
                class="label password"
                :class="{'move-label': isActiveLabelPassword , 'label-error': storeAuth.error || passwordError || lenPasswordError}"
              >Password</label>
              <input
                v-model="storeAuth.password"
                required
                :type="showPassword ? 'text' : 'password'" 
                class="input"
                :class="{'border-radius-bottom' : !storeAuth.dialogSignUp, 'red-border': storeAuth.errors[0] || storeAuth.error || passwordError || lenPasswordError}"
              >
              <div class="errors">
                {{ storeAuth.errors[0] }}
              </div>
              <div
                v-if="lenPasswordError"
                class="errors"
              >
                Password is blank
              </div>
              <div
                :class="{'password-visible' : !storeAuth.dialogSignUp }"
                @click="showPassword = !showPassword"
              />
            </div>
            <div
              v-if="storeAuth.dialogSignUp"
              class="input-content"
              @click="moveLabelFor('passwordRepeat')"
              @keyup="moveLabelFor('passwordRepeat')"
            >
              <label
                class="label password-repeat"
                :class="{'move-label': isActiveLabelPasswordRepeat, 'label-error': passwordError || lenPasswordRepeatError}"
              >Password Repeat</label>
              <input
                v-model="storeAuth.passwordRepeat"
                required
                :type="showPassword? 'text' : 'password'"
                class="input border-radius-bottom"
                :class="{'red-border': storeAuth.errors[0] || passwordError || lenPasswordRepeatError}"
              >
              <div
                v-if="lenPasswordRepeatError"
                class="errors"
              >
                Password is blank
              </div>
              <div
                v-if="passwordError"
                class="errors"
              >
                Passwords are not the same
              </div>
              <div
                class="password-visible"
                @click="showPassword = !showPassword"
              />
            </div>
            <p
              v-if="storeAuth.error"
              class="error"
            >
              {{ storeAuth.error }}
            </p>
            <div v-if="(storeAuth.dialogLogin && !storeAuth.dialogSignUp)">
              <p class="privacy-policy">
                We’ll call or text you to confirm your number. Standard message and data rates apply.
                <b class="text-underline">
                  Privacy Policy
                </b>
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
const showPassword = ref(false)
const isActiveLabelEmail = ref(false)
const isActiveLabelPassword = ref(false)
const isActiveLabelPasswordRepeat = ref(false)
const isActiveLabelName = ref(false)

const validateError = ref(false)
const lenPasswordError = ref(false)
const lenPasswordRepeatError = ref(false)
const lenEmailError = ref(false)
const lenNameError = ref(false)
const passwordError = ref(false)

const checkLen = () => {
  let passwordLen = storeAuth.password.length
  let passwordRepeatLen = storeAuth.passwordRepeat.length
  let emailLen = storeAuth.email.length
  let nameLen = storeAuth.name.length
  if (passwordLen > 0 && passwordRepeatLen > 0 && emailLen > 0 && nameLen > 0){
    lenPasswordError.value = false
    lenPasswordRepeatError.value = false 
    lenEmailError.value = false
    lenNameError.value = false 
    let validateResponse = checkValidate()
    let checkPasswordResponse =  checkPassword()
    if(validateResponse && checkPasswordResponse){
      return true
    }
  }
  else{
    passwordLen > 0 ? lenPasswordError.value = false : lenPasswordError.value = true
    passwordRepeatLen > 0 ? lenPasswordRepeatError.value = false : lenPasswordRepeatError.value = true
    emailLen > 0 ? lenEmailError.value = false : lenEmailError.value = true
    nameLen > 0? lenNameError.value = false : lenNameError.value = true
  }
}
const checkPassword = () => {
  let password = storeAuth.password
  let passwordRepeat = storeAuth.passwordRepeat
  if(password === passwordRepeat){
    passwordError.value = false
    return true
  }
  else{
    passwordError.value = true
    return false
  }
}
const checkValidate = () => {
  let emailRegExp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
  if(emailRegExp.test(storeAuth.email)) {
    validateError.value = false
    return true
  }
  else{
    validateError.value = true
    return false
  }
}
const loginOrSignUp = () =>{
if (storeAuth.dialogSignUp){
  const checkForm = checkLen()
  if(checkForm){
    storeAuth.createUser()
  }
}
else{
  let validate = checkValidate()
  storeAuth.password.length > 0 ?  lenPasswordError.value = false : lenPasswordError.value = true
  if(!lenPasswordError.value && validate){
    storeAuth.handleSubmit()
  }
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
  storeAuth.errors = ''
}
</script>
<style scoped>
.error {
  border-color: red;
}
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
  border: none;
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
  outline: none;
}
.border-radius-top{
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}
.border-radius-bottom {
  border-bottom-left-radius: 8px;
  border-bottom-right-radius: 8px;
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
  margin-top: 20px;
}
.btn:hover{
  background: linear-gradient(90deg, #ee2c5a 0%, #be2458 50%, #f82789 100%);
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
  margin-top: 20px;
  color:red
}
.label-error{
  color:red
}
.privacy-policy{
  font-size: 12px;
  padding-top: 20px;
}
.text-underline{
  text-decoration:underline;
  cursor: pointer;
  display: inline;
}
.greetings{
  margin-bottom: 20px
}
.password-visible{
  background-image: url('../../../assets/img/eye.svg');
  position: absolute;
  width: 24px;
  height: 24px;
  right: 11px;
  top: 17px;
  cursor: pointer;
}
.errors{
  color:red;
  line-height: 29px;
}
.red-border{
  border: 1px solid rgba(255, 0, 0, 0.384);
  box-shadow: 0 0 3px red;
}
</style>
