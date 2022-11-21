<template>
    <div class="container">
        <div class="navbar-block">
            <div class="logo"></div>


            <div v-if="storeNavbar.searchClose" class="btn-block" @click="searchOpen" >
                <div class="search-for-button"></div>
                <button class="btn" >Search</button>
            </div>
            <transition name="bounce">
            <div class="search-block" v-if="storeNavbar.searchOpen == true">
              <div class="search-name">
                <p style="border-bottom:2px solid black"> Stays</p>
                <p  @click.stop="searchClose">Experiences</p>
              </div>
              <div>
                <div class="block-for-input">
                  <div class="input-content">
                    <label>Name</label>
                    <input type="text" placeholder="Property name" class="input"/>
                  </div>
                  <div class="btn-block">
                      <div class="search-for-button"></div>
                      <button class="btn">Search</button> 
                  </div>

                </div>
              
              </div>

            </div>
            </transition>


            <div class="navigation-menu">
                <div class="block-svg" @click="loginOpen"></div>
                <div class="user-image"></div>
            </div>
            <div v-if="storeNavbar.loginOpen" class="open-action">
              <p>Log in</p>
              <p>Sign up</p>
            </div>
        </div>
    </div>
</template>

<script setup>

import {useStoreNavbar} from '@/store/store'

const storeNavbar = useStoreNavbar()

const searchOpen = () => {
  storeNavbar.searchOpen = true
  storeNavbar.searchClose = false

}

const searchClose = () => {
  storeNavbar.searchOpen = false
}

const loginOpen = () => {
  storeNavbar.loginOpen = !storeNavbar.loginOpen

}
</script>
<style scoped>
*{
  display: inline-block;
}
.bounce-enter-active {
  animation: bounce-in 0.7s;
}
.bounce-leave-active {
  animation: bounce-in 0.9s reverse;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.25);
  }
  100% {
    transform: scale(1);
  }
}

.container{
    width: 95%;
    /* height: 78px; */
    margin:0 auto;
    display: block !important ;


}
.navbar-block{
    display: flex;
    justify-content: space-between;
    padding: 20px 0;
}
.logo{
    background-image: url('../../../assets/img/logo.svg');
    width: 72px;
    height: 22px;
    margin-top: 6px
}
.btn-block{
position: relative;
margin:2px;
}
.btn{
    background: linear-gradient(90deg, #E61E4D 0%, #E31C5F 50%, #D70466 100%);
    border-radius: 25px;
    border:none;
    padding: 10px 15px 10px 30px;
    color:white;
    z-index: 0;
}
.search-for-button{
    background-image: url('../../../assets/img/search.svg');
    width: 11.6px;
    height: 11.6px;
    position: absolute;
    top:11px;
    left:10px;
}
.navigation-menu{
    width: 66px;
    height: 38px;
    padding:2px;
    border: 0.725px solid #DDDDDD;
    border-radius: 18px;
    position: relative;
    display: flex;
    justify-content: space-between;
    background-color: white !important;
}
.block-svg{
    background-image: url('../../../assets/img/block.svg');
    width:10.15px;
    height:7.8px;
    position: absolute;
    top:14px;
    left:10px
}
.user-image{
    background-image: url('../../../assets/img/userImage.svg');
    width: 21.75px;
    height: 21.75px;
    position: absolute;
    top:6px;
    right:10px
}
.search-block{
  height: 100px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  

}
.block-for-input{
  width: 620px;
  height: 54px;
  padding:6px;
  border: 0.725px solid #FFFFFF;
  box-shadow: 0px 4.35px 14.5px rgba(0, 0, 0, 0.2);
  border-radius: 23.2px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.input-content{
  display: flex;
  flex-direction: column ;
  margin:5px
}
.search-name{
  margin: 0 auto;
}
p{
  margin:6px 10px 0 10px;
  padding-bottom:3px
}
.input{
  border: none;
}
label{
  font: 800 12px / 12px 'Roboto';
  margin-bottom:3px;
}
.open-action{
  position: fixed;
  top:70px;
  right:45px;
  z-index: 10;
  width: 287px;
  height: 106px;
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
background-color: white;
}
.darkBlock{
    background: rgba(0, 0, 0, 0.5);
}

</style>