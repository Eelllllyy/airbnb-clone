<template>
  <header class="header">
    <nav class="navbar-block">
      <img
          src="../../../assets/img/logo.svg"
          class="logo"
          @click="$router.push('/')"
      >
      <div
          v-if="storeAuth.searchClose"
          class="btn-block"
          @click="searchOpen"
      >
        <div class="search-for-button"/>
        <button
            v-if="route.params.id === undefined"
            class="btn"
            @click="searchOpen"
        >
          <b>Search</b>
        </button>
      </div>
      <transition name="bounce">
        <div
            v-if="storeAuth.searchOpen"
            class="search-block"
        >
          <div class="search-name">
            <p class="stays">
              Stays
            </p>
            <p class="experiences">
              Experiences
            </p>
          </div>
          <div v-if="storeAuth.searchOpen">
            <div class="block-for-input">
              <form
                  class="input-content"
                  @submit.prevent
              >
                <label class="label">Name</label>
                <input
                    type="text"
                    placeholder="Property name"
                    class="input"
                    v-model="storeImages.search"
                >
              </form>
              <div class="btn-block">
                <div class="search-for-button"/>
                <button class="btn"
                        @click="searchCards">
                  Search
                </button>
              </div>
            </div>
          </div>
        </div>
      </transition>

      <button
          class="navigation-menu"
          @click="loginOpen"
      >
        <div class="block-svg"/>
        <div class="user-image"/>
      </button>
      <transition name="fade">
        <div
            v-if="storeAuth.loginOpen"
            class="open-action"
        >
          <button
              class="pointer"
              @click="showLogin"
          >
            Log in
          </button>
          <button
              class="pointer"
              @click="showSignUp"
          >
            Sign up
          </button>
        </div>
      </transition>

      <transition name="fade">
        <div
            v-if="storeAuth.logOutOpen"
            class="open-action exit"
        >
          <button
              class="pointer"
              @click="toExit"
          >
            Log out
          </button>
        </div>
      </transition>
    </nav>
  </header>
  <div
      :class="{'dark-block': ( storeAuth.dialogLogin || storeAuth.dialogSignUp)}"
      @click="closeDialogWindow"
  >
    <transition name="fade">
      <DialogLoginOrSignUp
          v-if="storeAuth.dialogLogin"
          class="test"
          @click.stop
      />
    </transition>
  </div>
</template>

<script setup>
import DialogLoginOrSignUp from '@/components/DialogLoginOrSignUp.vue'
import {useStoreAuth, useStoreImages} from '@/store/store'
import {useRoute} from 'vue-router'

const route = useRoute()
const storeImages = useStoreImages()
const storeAuth = useStoreAuth()


// const isVisible = () => {
//   route.params.id !== 0
// }
const searchCards = async () => {
  await storeImages.getCards()
}
const searchOpen = () => {
  storeAuth.searchOpen = true
  storeAuth.searchClose = false
}
const loginOpen = () => {
  if (!storeAuth.isAuth) {
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
  storeAuth.dialogLogin = true
}
const toExit = () => {
  storeAuth.logOutOpen = false
  storeAuth.deleteSession()
}
const closeDialogWindow = () => {
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
* {
  display: inline-block;
}

.bounce-enter-active {
  animation: bounce-in 0.7s;
}

.bounce-leave-active {
  animation: bounce-in 0.8s reverse;
}

@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.7s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.header {
  display: block !important;
  position: sticky;
  top: 0;
  z-index: 1000;
  background-color: white;
}

.navbar-block {
  display: flex;
  justify-content: space-between;
  padding: 20px 0;
  width: 95%;
  margin: 0 auto;
}

.logo {
  width: 118px;
  height: 35px;
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
  padding: 10px 16px 10px 30px;
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
  background-color: white;
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
  border: 0.725px solid #FFFFFF;
  box-shadow: 0px 0px 10.5px rgba(0, 0, 0, 0.2);
  border-radius: 23.2px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.input-content {
  display: flex;
  flex-direction: column;
  margin: 5px;
  width: 90%;
}

.search-name {
  margin: 0 auto;
}

.stays {
  margin: 0 0 16px 0;
  padding: 10px 20px 5px 20px;
}

.experiences {
  color: #BBBBBB;
  margin: 0 0 16px 0;
  padding: 10px 20px 5px 20px;
  cursor: not-allowed;
}

.stays {
  border-bottom: 2px solid #222222;
}

.input {
  border: none;
  font: 500 12px / 12px 'Roboto';
  margin-bottom: 3px;
  outline: none;
  margin-left: 6px;
}

.label {
  font: 800 12px / 12px 'Roboto';
  margin: 0 0 3px 5px;
}

.open-action {
  position: fixed;
  top: 70px;
  right: 45px;
  z-index: 10;
  width: 187px;
  height: 112px;
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  background-color: white;
  box-shadow: 0px 0px 7px rgba(119, 119, 119, 0.411);
}

.test {
  width: 100%;
  position: fixed;
  z-index: 1000;
}

.dark-block {
  background: rgba(0, 0, 0, 0.315);
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 1000;
}

.pointer {
  cursor: pointer;
  padding: 8px 20px;
  text-align: left;
  background-color: white;
  border: none;
  font-size: 14px;
}

.pointer:hover {
  background-color: rgba(170, 170, 170, 0.199);
}

.navigation-menu:hover {
  box-shadow: 0px 0px 7px rgba(119, 119, 119, 0.411);
}

.exit {
  height: 60px;
}
</style>
