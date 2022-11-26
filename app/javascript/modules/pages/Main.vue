<template>
  <div>
    <header class="navbar">
      <Navbar />
    </header>
    <div
      :class="{'dark-block': storeAuth.searchOpen}"
      @click="searchClose"
    />
    <main
      class="wrapper"
    >
      <div
        id="container"
        class="container"
      >
        <div 
          v-for="card in storeImages.cards"
          class="card-with-photo"
          @click="goToStay(card.id)"
        >
          <OneCard
            :key="card.id"
            :card="card"
          />
        </div>
        <infinite-loading
          target="#container"
          @infinite="load"
        />
      </div>
      <button @click="storeImages.loadMoreImages">
        lzlzlz
      </button>
      <Footer />
    </main> 
  </div>
</template>
<script setup>
import {useStoreAuth,useStoreImages} from '@/store/store'
import { useRouter, useRoute } from 'vue-router'
import Footer from '@/components/Footer.vue'
import OneCard from '@/components/OneCard.vue'
import Navbar from '@/components/Navbar.vue';
import InfiniteLoading from "v3-infinite-loading";
import { ref, onMounted, watch } from 'vue';

const storeAuth = useStoreAuth()
const storeImages = useStoreImages()
const router = useRouter()
const route = useRoute()

const searchClose = () => {
  storeAuth.searchOpen = false
  storeAuth.loginOpen = false
  storeAuth.logOutOpen = false
  storeAuth.dialogLogin = false
  storeAuth.dialogSignUp = false

  setTimeout(() => (storeAuth.searchClose = true), 1000)
}

const getCards = onMounted(async () => {
  await storeImages.getCards()
})

const load = () => {
  storeImages.loadMoreCards()
}
const goToStay = (id) => {
  router.push(`/stays/${id}`)
}
</script>

<style scoped>
.wrapper {
  width: 100%;
}
.container{
  width: 95%;
  padding-top: 90px;
  margin:0 auto;
  height: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  flex-wrap: wrap;
}
.dark-block {
  background: rgba(0, 0, 0, 0.315);
  position: fixed;
  width: 100%;
  height: 100%;
  top: 139px;
  left:0;
  z-index: 100;
}
.card-with-photo {
  position: relative;
  height: 400px;
  margin-bottom: 30px;
}
.card-with-photo:hover .btn{
  visibility: visible;
  position: absolute;
  border-radius: 20px;
  padding: 9px 11px 7px 12px;
  border: none;
  background-color: #f8f8f8b2;
  transition: background-color 1s cubic-bezier(.12,.38,.16,.74);
}
.navbar{
  position: fixed;
  z-index: 1000;
  width: 100%;
}
</style>
