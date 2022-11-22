<template>
<div  @click.capture="startPosName">
  <div  @click.capture="startPosPassword">
    <div class="login-block" @click.capture="startPosEmail">
      <div class="block-one">
        <div class="cross" @click="closeAndReset"></div>
        <h4 class="header">Log in or sign up</h4>
      </div>
    <div class='block-three'></div>
      <div class="block-two" >
        <h2 style="margin-bottom:20px">Welcome to Airbnb</h2>
        <div class="input-content " @click="moveLabelforEmail" @keyup="moveLabelforEmail">
          <label class="label email">Email</label>
          <input v-model="storeAuth.email" class="input one"/> 
        </div>
        <div class="input-content" @click="moveLabelforName" @keyup="moveLabelforName">
          <label class="label name">Name</label>
          <input v-model="storeAuth.name" class="input"/>
        </div>
        <div class="input-content" @click="moveLabelforPassword" @keyup="moveLabelforPassword">
          <label class="label password">Password</label>
          <input v-model="storeAuth.password" type="password" class="input two"/>
        </div> 
        <div class="input-content" @click="moveLabelforPassword">
          <label class="label password">Password Repeat</label>
          <input v-model="storeAuth.passwordRepeat" type="password" class="input two"/>
        </div>        
      </div>
    <p class="error">{{storeAuth.error}}</p>
    <div><button class="btn" @click="storeAuth.createUser"> Continue </button></div>
    </div>
  </div>
</div> 
</template>
    <script setup>
import {useStoreAuth} from '@/store/store'
const storeAuth = useStoreAuth()

const moveLabelforEmail = () => {
  let el = document.getElementsByClassName('email')
  el[0].classList.add('move-label')
}
const startPosEmail = () => {
  if(storeAuth.email == ''){
    let el = document.getElementsByClassName('email')
    el[0].classList.remove('move-label')
  }
}
const moveLabelforPassword = () => {
  let el = document.getElementsByClassName('password')
  el[0].classList.add('move-label')
  el[1].classList.add('move-label')
}
const startPosPassword = () => {
  if(storeAuth.password == ''){
    let el = document.getElementsByClassName('password')
    el[0].classList.remove('move-label')
    el[1].classList.remove('move-label')
  }
}
const moveLabelforName = () => {
  let el = document.getElementsByClassName('name')
  el[0].classList.add('move-label')
}
const startPosName = () => {
  if(storeAuth.name == ''){
    let el = document.getElementsByClassName('name')
    el[0].classList.remove('move-label')
  }
}
const closeAndReset = () => {
  storeAuth.dialogSignUp = false
  storeAuth.dialogLogin = false
  storeAuth.email = ''
  storeAuth.password = ''
  storeAuth.name = ''
  storeAuth.error = ''
} 
</script>
<style scoped>
.login-block{
  position: fixed;
  height: 542px;
  left: 33.56%;
  right: 33.56%;
  top: 218px;
  padding: 0 25px 15px 25px;
  background: #FFFFFF;
  box-shadow: 0px 8px 28px rgba(0, 0, 0, 0.28);
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.block-one{
  display: inline-block;
  position: relative;
}
.cross{
  background-image: url('../../../assets/img/cross.svg');
  width: 16px;
  height: 16px;
  position: absolute;
  top:10px;
  left:10px;
  cursor: pointer;
  }
.header{
  position: absolute;
  padding-top: 10px;
  left: calc(50% - 123.21px/2 + 0.1px);
  top: -0.67px;
}
.input{
  background: #FFFFFF;
  font-size: 16px;
  width: 100%;
  height: 60px;;
  border: 1px solid rgba(128, 128, 128, 0.274);
  padding: 7px 7px 0 7px;
  cursor: pointer;
}
.one{
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
}
.two{
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
  border:none;
  cursor: pointer;
}
.block-three{
  border-bottom: 1px solid rgba(128, 128, 128, 0.274);
  margin:10px 0 0px 0;
}
.input-content{
  position: relative;
}
.label{
  color: #717171;
  position: absolute;
  top:20px;
  left:15px;
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
  color:red
}
</style>