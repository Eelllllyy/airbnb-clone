<template>
  <div :class="{darkBlock: storeNavbar.loginOpen }">
    <Navbar/>
    <router-view></router-view>

  </div>
</template>

<script>
import Navbar from '@/components/Navbar.vue';
import {useStoreNavbar} from '@/store/store'
export default{
  components:{
  Navbar
},

setup() {

const storeNavbar = useStoreNavbar()

return{storeNavbar}
}
}

</script>
<style>
*{
  margin:0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Roboto';
  font-weight: 400;
}
.darkBlock{
    background: rgba(0, 0, 0, 0.315);
    z-index: 20;
}
</style>