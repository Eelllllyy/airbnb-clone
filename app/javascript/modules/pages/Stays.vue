<template>
  <header class="navbar">
    <Navbar />
  </header>
  <div
    :class="{'dark-block': storeAuth.searchOpen}"
    @click="searchClose"
  />
  <div>
    <main class="main">
      <section class="section-description">
        <h2>{{stay?.name}}</h2>
        <div class="place-description">
          <div class="block-one">
            <div>
              <div class="star" />
              <h4>{{stay?.rating}}</h4>
              <h4>·</h4>
              <h4 class="underline">
                3 reviews
              </h4>
              <p class="padding-left">
                ·
              </p>
              <p class="padding-top-right">
                Superhost
              </p>
              <p class="padding-right">
                ·
              </p>
              <h4 class="underline">
                {{stay?.location}}
              </h4> 
            </div>
          </div>
          <div class="block-two">
            <div class="pointer">
              <div class="share" />
              <h4 class="underline">
                Share
              </h4>
            </div>
            <div class="pointer">
              <div class="like" />
              <h4 class="underline">
                Save
              </h4>
            </div>
          </div>
        </div>
        <div />
      </section>
      <section class="section-picture">
        <div class="container-for-img-1"> 
          <img
            :src="stay?.photos[0].url"
            alt="avatar"
            class="img-1"
          >
        </div>
        <div class="container-for-img-2">
          <img
            :src="stay?.photos[1].url"
            alt="avatar"
            class="img-2"
          >
          <img
            :src="stay?.photos[2].url"
            alt="avatar"
            class="img-3"
          >
          <img
            :src="stay?.photos[3].url"
            alt="avatar"
            class="img-4"
          >
          <img
            :src="stay?.photos[4].url"
            alt="avatar"
            class="img-5"
          >
        </div>
      </section>
      <section class="section-about-host">
        <div>
          <h3>Entire villa hosted by {{stay?.host.name}}</h3><br>
          <span>10 guests</span>
          <span>· 5 bedrooms</span>
          <span>· 5 beds</span>
          <span>· 3 baths</span>
        </div>
        <div>
          <img
            :src="stay?.host.avatar.url"
            class="img-host"
          >
        </div>
      </section>
      <div class="line-gray" />
      <div>
        <article class="block-for-characteristics">
          <div class="reward" />
          <h4>Jenny is a Superhost</h4><br>
          <p class="text-gray">
            Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.
          </p>
        </article>
        <article class="block-for-characteristics">
          <div class="key" />
          <h4>Great check-in experience</h4><br>
          <p class="text-gray">
            100% of recent guests gave the check-in process a 5-star rating.
          </p>
        </article>
        <article class="block-for-characteristics">
          <div class="calendar" />
          <h4>Free cancellation for 48 hours.</h4>
        </article>
      </div>
      <div class="line-gray" />
      <div class="block-aircover">
        <div class="aircover" />
        <p>Every booking includes free protection from Host cancellations, listing inaccuracies, and other issues like trouble checking in.</p><br>
        <h4 class="decoration underline">
          Learn more
        </h4>
      </div>
      <div class="line-gray" />
      <div class="description-room">
        <p>Relax with the whole family at this peaceful 5 Bedroom Villa overlooking Hout Bay Beach</p>
        <p>5 Bedroom Villa overlooking Hout Bay Beach 5 BEDROOMS – 3 BATHROOMS</p>
        <p>This spacious modern family home boasting 5 bedrooms. The main bedroom ( en-suite) has a king-size bed, the remaining four bedrooms have queen-sized beds</p>
        <h4 class="underline">
          Show more >
        </h4>
      </div>
      <div class="line-gray" />
      <section class="section-offers">
        <h2>What this place offers</h2>
        <div class="flex-offers">
          <div>
            <div class="block-icon">
              <div class="icon-1" />
              <p>Bay view</p>
            </div>
            <div class="block-icon">
              <div class="icon-2" />
              <p>Kitchen</p>
            </div>
            <div class="block-icon">
              <div class="icon-3" />
              <p>Free parking on premises</p>
            </div>
            <div class="block-icon">
              <div class="icon-4" />
              <p>HDTV</p>
            </div>
            <div class="block-icon">
              <div class="icon-5" />
              <p class="line-through">
                Carbon monoxide alarm
              </p>
            </div>
          </div>
          <div>
            <div class="block-icon">
              <div class="icon-6" />
              <p>Beach view</p>
            </div>
            <div class="block-icon">
              <div class="icon-7" />
              <p>Wifi</p>
            </div>
            <div class="block-icon">
              <div class="icon-8" />
              <p>Pool</p>
            </div>
            <div class="block-icon">
              <div class="icon-9" />
              <p>Washer</p>
            </div>
            <div class="block-icon">
              <div class="icon-10" />
              <p class="line-through">
                Smoke alarm
              </p>
            </div>
          </div>
        </div>
        <button class="btn">
          <h3>Show all 20 amenities</h3>
        </button>
      </section>
    </main>
    <FooterDeploed />
  </div>
</template>
<script setup>
import { useRoute } from 'vue-router'
import {useStoreAuth} from '@/store/store'
import axios from 'axios'
import { ref, onMounted } from 'vue';
import FooterDeploed from '@/components/FooterDeploed.vue'
import Navbar from '@/components/Navbar.vue';

const route = useRoute()
const storeAuth = useStoreAuth()
const stay = ref(null)

const goToLocation = onMounted(async () => {
    try{
      const response = await axios.get(`/api/stays/${route.params.id}`)
      stay.value = response.data
    }catch(e){
      console.error(e)
    }
  }
)

const searchClose = () => {
  storeAuth.searchOpen = false
  storeAuth.loginOpen = false
  storeAuth.logOutOpen = false
  storeAuth.dialogLogin = false
  storeAuth.dialogSignUp = false

  setTimeout(() => (storeAuth.searchClose = true), 1000)
}
</script>
<style scoped>
.main{
  width: 59%;
  margin: 0 auto;
  padding-top: 90px;
}
.place-description , .block-one , .block-two{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin:10px 0;
}
h4 , p, .star , .share , .like, .img-1 ,.img-2 , .img-3 , .img-4, .img-5{
  display: inline-block;
}
.star{
  background-image: url('../../../assets/img/star.svg');
  width: 13.79px;
  height: 13.16px;
  margin-right: 5px;
}
.share{
  background-image: url('../../../assets/img/share.svg');
  width: 16px;
  height: 16px;
  margin-right: 8px;
}
.like{
  background-image: url('../../../assets/img/like.svg');
  width: 16px;
  height: 16px;
  margin: 0 8px 0 15px;
}
.section-picture{
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-between;
}
.container-for-img-1{
width: 50%;
}
.container-for-img-2{
  width: 49.5%;
  display: flex;
  flex-wrap: wrap;
}
.img-1{
  max-width: 100%;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  height: 560px;
  object-fit: cover
}
.img-2{
  width: 49.5%;
  object-fit: cover
}
.img-3{
  width: 49.5%;
  border-top-right-radius: 20px;
  object-fit: cover
}
.img-4{
  width: 49.5%;
  padding-top: 5px;
  object-fit: cover
}
.img-5{
  width: 49.5%;
  padding-top: 5px;
  border-bottom-right-radius: 20px;
  object-fit: cover
}
.section-about-host{
  margin: 46px 0;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.img-host{
  width: 56px;
  height: 56px;
  border-radius: 30px;
  object-fit: cover
}
.line-gray{
  border: 1px solid #DDDDDD;
  height: 1px;
}
.block-for-characteristics{
  position: relative;
  padding: 28px 84px;
}
.reward{
  background-image: url('../../../assets/img/reward.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  left: 15px;
}
.key{
  background-image: url('../../../assets/img/key.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  left: 15px;
}
.calendar{
  background-image: url('../../../assets/img/calendar.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  left: 15px;
}
.aircover{
  background-image: url('../../../assets/img/aircover.svg');
  width: 123.16px;
  height: 26px;
  margin: 32px 0;
}
.decoration{
  margin: 26px 0 30px;
}
.description-room{
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  min-height: 260px;
}
.section-offers{
  margin: 48px 0
}
.flex-offers{
  display: flex;
  flex-direction: row;
  margin: 24px 0 47px 0;
}
.block-icon{
  position: relative;
  margin: 18px;
  padding: 0 40px;
}
.icon-1{
  background-image: url('../../../assets/img/icon-1.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-2{
  background-image: url('../../../assets/img/icon-2.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-3{
  background-image: url('../../../assets/img/icon-3.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-4{
  background-image: url('../../../assets/img/icon-4.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-5{
  background-image: url('../../../assets/img/icon-5.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-6{
  background-image: url('../../../assets/img/icon-6.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-7{
  background-image: url('../../../assets/img/icon-7.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-8{
  background-image: url('../../../assets/img/icon-8.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-9{
  background-image: url('../../../assets/img/icon-9.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.icon-10{
  background-image: url('../../../assets/img/icon-10.svg');
  width: 24px;
  height: 24px;
  position: absolute;
  top: 0;
  left: 0;
}
.btn{
  background: #FFFFFF;
  border: 1px solid #222222;
  border-radius: 8px;
  padding: 13px 24px;
  cursor: pointer;
}
.pointer{
  cursor: pointer;
}
.underline{
  text-decoration: underline;
  cursor: pointer;
}
.text-gray{
  color: #717171;
  padding-top: 8px ;
}
.line-through{
  text-decoration: line-through;
}
.navbar{
  position: fixed;
  z-index: 1000;
  width: 100%;
}
.dark-block {
  background: rgba(0, 0, 0, 0.315);
  position: fixed;
  width: 100%;
  height: 100%;
  top: 139px;
  left: 0;
  z-index: 100;
}
.padding-left{
  padding-left: 10px
}
.padding-top-right{
  padding: 0 12px;
}
.padding-right{
  padding-right: 8px
}

</style>