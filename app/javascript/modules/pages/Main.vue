<template>
  <div class="wrapper" @click="searchClose" :class="{darkBlock: storeAuth.searchOpen}">
  </div>
</template>
<script setup>
import {useStoreAuth} from '@/store/store'
const storeAuth = useStoreAuth()
const searchClose = () => {
    storeAuth.searchOpen = false
    storeAuth.loginOpen = false
    storeAuth.dialogLogin = false
    storeAuth.dialogSignUp = false
    setTimeout(() => storeAuth.searchClose = true, 1000)
}
</script>
<style scoped>
.wrapper{
  width: 100%;
  height: 600px;
}
.darkBlock{
  background: rgba(0, 0, 0, 0.315);
  z-index: 30;
}
</style>