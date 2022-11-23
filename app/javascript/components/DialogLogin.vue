<template>
  <div @click.capture="startPosEmail">
    <div
      class="login-block"
      @click.capture="startPosPassword"
    >
      <div class="block-one">
        <div
          class="cross"
          @click="closeAndReset"
        />
        <h4 class="header">
          Log in or sign up
        </h4>
      </div>
      <div class="block-three" />
      <div class="block-two">
        <h2 style="margin-bottom: 20px">
          Welcome to Airbnb
        </h2>
        <div
          class="input-content"
          @click.stop="moveLabelforEmail"
          @keyup="moveLabelforEmail"
        >
          <label class="label email">Email</label>
          <input
            v-model="storeAuth.email"
            class="input one"
          >
        </div>
        <div
          class="input-content"
          @click.stop="moveLabelforPassword"
          @keyup="moveLabelforPassword"
        >
          <label class="label password">Password</label>
          <input
            v-model="storeAuth.password"
            type="password"
            class="input two"
          >
          <p class="error">
            {{ storeAuth.error }}
          </p>
        </div>
      </div>
      <div>
        <p style="font-size: 12px">
          We’ll call or text you to confirm your number. Standard message and data rates apply. Privacy Policy
        </p>
      </div>
      <div>
        <button
          class="btn"
          @click="submitResult"
        >
          Continue
        </button>
      </div>
    </div>
  </div>
</template>
<script setup>
import { useStoreAuth } from '@/store/store'

const storeAuth = useStoreAuth()
const submitResult = async () => {
  if (await storeAuth.handleSubmit()) {
    console.log('rrr')
  }
}
const moveLabelforEmail = () => {
  let el = document.getElementsByClassName('email')
  el[0].classList.add('move-label')
}
const startPosEmail = () => {
  if (storeAuth.email == '') {
    let el = document.getElementsByClassName('email')
    el[0].classList.remove('move-label')
  }
}
const moveLabelforPassword = () => {
  let el = document.getElementsByClassName('password')
  el[0].classList.add('move-label')
}
const startPosPassword = () => {
  if (storeAuth.password == '') {
    let el = document.getElementsByClassName('password')
    el[0].classList.remove('move-label')
  }
}
const closeAndReset = () => {
  storeAuth.dialogSignUp = false
  storeAuth.dialogLogin = false
  storeAuth.email = ''
  storeAuth.password = ''
  storeAuth.error = ''
}
</script>
<style scoped>
.login-block {
  position: fixed;
  max-width: 500px;
  height: 442px;
  left: 33.56%;
  right: 33.56%;
  top: 218px;
  padding: 0 25px 25px 25px;
  background: #ffffff;
  box-shadow: 0px 8px 28px rgba(0, 0, 0, 0.28);
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.block-one {
  display: inline-block;
  position: relative;
}
.cross {
  background-image: url('../../../assets/img/cross.svg');
  width: 16px;
  height: 16px;
  position: absolute;
  top: 10px;
  left: 10px;
  cursor: pointer;
}
.header {
  position: absolute;
  padding-top: 9px;
  left: calc(50% - 123.21px / 2 + 0.1px);
  top: -0.67px;
}
.input {
  background: #ffffff;
  font-size: 16px;
  width: 100%;
  height: 60px;
  border: 1px solid rgba(128, 128, 128, 0.274);
  padding: 7px 7px 0 7px;
  cursor: pointer;
}
.one {
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}
.two {
  border-bottom-left-radius: 8px;
  border-bottom-right-radius: 8px;
}

.btn {
  width: 100%;
  height: 48px;
  color: white;
  font: 600 15px / 30px 'Roboto';
  background: linear-gradient(90deg, #e61e4d 0%, #e31c5f 50%, #d70466 100%);
  border-radius: 8px;
  border: none;
  cursor: pointer;
}
.block-three {
  border-bottom: 1px solid rgba(128, 128, 128, 0.274);
  margin: 10px 0 6px 0;
}

.input-content {
  position: relative;
}
.label {
  color: #717171;
  position: absolute;
  top: 20px;
  left: 18px;

  transition-timing-function: ease-in-out;
  transition-duration: 0.3s;
}
.move-label {
  transform: translate(-11px, -11px);
  font-size: 12px;
  transition-timing-function: ease-in-out;
  transition-duration: 0.3s;
}
.error {
  margin: 15px 0 0 0px;
  color: red;
}
</style>
