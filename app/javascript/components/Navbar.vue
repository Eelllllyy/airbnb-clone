<template>
  <div class="container">
    <div class="navbar-block">
      <div
        class="logo"
        @click="$router.push('/')"
      />

      <div
        v-if="storeAuth.searchClose"
        class="btn-block"
        @click="searchOpen"
      >
        <div class="search-for-button" />
        <button class="btn">
          Search
        </button>
      </div>
      <transition name="bounce">
        <div
          v-if="storeAuth.searchOpen"
          class="search-block"
        >
          <div class="search-name">
            <p style="border-bottom: 2px solid black">
              Stays
            </p>
            <p>Experiences</p>
          </div>
          <div>
            <div class="block-for-input">
              <div class="input-content">
                <label>Name</label>
                <input
                  type="text"
                  placeholder="Property name"
                  class="input"
                >
              </div>
              <div class="btn-block">
                <div class="search-for-button" />
                <button class="btn">
                  Search
                </button>
              </div>
            </div>
          </div>
        </div>
      </transition>

      <div
        class="navigation-menu"
        @click="loginOpen"
      >
        <div class="block-svg" />
        <div class="user-image" />
      </div>
      <transition name="fade">
        <div
          v-if="storeAuth.loginOpen"
          class="open-action"
        >
          <p
            class="pointer"
            @click="showLogin"
          >
            Log in
          </p>
          <p
            class="pointer"
            @click="showSignUp"
          >
            Sign up
          </p>
        </div>
      </transition>

      <transition name="fade">
        <div
          v-if="storeAuth.logOutOpen"
          class="open-action"
          style="height: 60px"
        >
          <p
            class="pointer"
            style="margin: 0 0 0 15px"
            @click="toExit"
          >
            Log out
          </p>
        </div>
      </transition>
    </div>
    <div :class="{ darkBlock: storeAuth.dialogLogin || storeAuth.dialogSignUp }">
      <transition name="fade">
        <DialogLogin
          v-if="storeAuth.dialogLogin"
          class="test"
        />
      </transition>
      <transition name="fade">
        <DialogSignUp v-if="storeAuth.dialogSignUp" />
      </transition>
    </div>
  </div>
</template>

<script setup>
import { useStoreAuth } from '@/store/store'
const storeAuth = useStoreAuth()
const searchOpen = () => {
  storeAuth.searchOpen = true
  storeAuth.searchClose = false
}
const loginOpen = () => {
  if (storeAuth.isAuth == false) {
    storeAuth.loginOpen = !storeAuth.loginOpen
  }
  if (storeAuth.isAuth) {
    storeAuth.logOutOpen = !storeAuth.logOutOpen
  }
}
const showLogin = () => {
  storeAuth.loginOpen = false
  storeAuth.logOutOpen = false
  storeAuth.dialogLogin = true
  storeAuth.dialogSignUp = false
}
const showSignUp = () => {
  storeAuth.loginOpen = false
  storeAuth.logOutOpen = false
  storeAuth.dialogSignUp = true
  storeAuth.dialogLogin = false
}
const toExit = () => {
  storeAuth.logOutOpen = false
  storeAuth.deleteSession()
}
</script>
<script>
import DialogLogin from '@/components/DialogLogin.vue'
import DialogSignUp from '@/components/DialogSignUp.vue'
export default {
  components: {
    DialogLogin,
    DialogSignUp,
  },
}
</script>
<style scoped>
* {
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
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
.container {
  display: block !important ;
}
.navbar-block {
  display: flex;
  justify-content: space-between;
  padding: 20px 0;
  width: 95%;
  margin: 0 auto;
}
.logo {
  background-image: url('../../../assets/img/logo.svg');
  width: 72px;
  height: 22px;
  margin-top: 6px;
  cursor: pointer;
}
.btn-block {
  position: relative;
  margin: 2px;
  cursor: pointer;
}
.btn {
  background: linear-gradient(90deg, #e61e4d 0%, #e31c5f 50%, #d70466 100%);
  border-radius: 25px;
  border: none;
  padding: 10px 15px 10px 30px;
  color: white;
  z-index: 0;
  cursor: pointer;
}
.search-for-button {
  background-image: url('../../../assets/img/search.svg');
  width: 11.6px;
  height: 11.6px;
  position: absolute;
  top: 11px;
  left: 10px;
}
.navigation-menu {
  width: 66px;
  height: 38px;
  padding: 2px;
  border: 0.725px solid #dddddd;
  border-radius: 18px;
  position: relative;
  display: flex;
  justify-content: space-between;
  cursor: pointer;
}
.block-svg {
  background-image: url('../../../assets/img/block.svg');
  width: 10.15px;
  height: 7.8px;
  position: absolute;
  top: 14px;
  left: 10px;
}
.user-image {
  background-image: url('../../../assets/img/userImage.svg');
  width: 21.75px;
  height: 21.75px;
  position: absolute;
  top: 6px;
  right: 10px;
  /* cursor: pointer; */
}
.search-block {
  height: 100px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.block-for-input {
  width: 620px;
  height: 54px;
  padding: 6px;
  border: 0.725px solid #ffffff;
  box-shadow: 0px 4.35px 14.5px rgba(0, 0, 0, 0.2);
  border-radius: 23.2px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.input-content {
  display: flex;
  flex-direction: column;
  margin: 5px;
  width: 60%;
}
.search-name {
  margin: 0 auto;
}
p {
  margin: 6px 10px 0 10px;
  padding-bottom: 3px;
}
.input {
  border: none;
  outline: none;
}
label {
  font: 800 12px / 12px 'Roboto';
  margin-bottom: 3px;
}
.open-action {
  position: fixed;
  top: 70px;
  right: 45px;
  z-index: 10;
  width: 187px;
  height: 106px;
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  background-color: white;
  box-shadow: 0px 2px 7px rgba(119, 119, 119, 0.411);
  /* border:1px solid rgba(88, 88, 88, 0.308) */
}
/* .open-action-logout{
  position: fixed;
  top:70px;
  right:45px;
  z-index: 10;
  width: 187px;
  height: 56px;
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  background-color: white;
  box-shadow: 0px 2px 7px rgba(119, 119, 119, 0.411);
} */
/* .darkBlock{
  background: rgba(0, 0, 0, 0.5);
} */
.test {
  width: 100%;
  position: fixed;
  z-index: 1000;
}
.darkBlock {
  background: rgba(0, 0, 0, 0.315);
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}
.pointer {
  cursor: pointer;
}
</style>
