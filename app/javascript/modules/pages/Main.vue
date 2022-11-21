<template>
    <div class="wrapper" @click="searchClose" :class="{darkBlock: storeNavbar.searchOpen }">
 <h1>Hello {{storeAuth.test}}</h1>
    </div>
   
</template>
<script setup>
import {useStoreAuth} from '@/store/store'
import {useStoreNavbar} from '@/store/store'
const storeAuth = useStoreAuth()
const storeNavbar = useStoreNavbar()

const searchClose = () => {
    storeNavbar.searchOpen = false
    storeNavbar.loginOpen = false
    setTimeout(() => storeNavbar.searchClose = true, 1000)
}
// const searchClose = storeNavbar.toSearchClose()
</script>


<style scoped>
.wrapper{
    width: 100%;
    height: 600px;
}
.darkBlock{
    background: rgba(0, 0, 0, 0.315);
    z-index: 20;
}
</style>