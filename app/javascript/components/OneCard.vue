<template>
  <Swiper 
  :slides-per-view="1"
  :modules="[Navigation, Pagination , Virtual]"
  navigation :pagination="{clickable:true, dynamicBullets: true}" grab-cursor 
  
  class="default-slider"  
  >

    <SwiperSlide v-for="photo in card.photos"> 
        <img
        class="img"
        :src="photo.url"
        alt="avatar"
    >
    </SwiperSlide>
  </Swiper>

<div class="rating">
    <h5>{{ card?.location }}</h5>
    <div>
      <div class="star-mini" />
      <h5>{{ card.rating }}</h5>
    </div>
</div>
  <p class="gray-text">
    Added 10 weeks ago
  </p>
  <p class="gray-text">
    Apr 2 – 7
  </p>
  <h5>{{ card?.price }} night</h5>
  <div class="like-stay" />
</template>
<script setup>
import { ref } from 'vue';
import { useStoreAuth , useStoreImages } from '@/store/store'

import { Swiper, SwiperSlide } from "swiper/vue";
import { Navigation , Pagination , Virtual} from "swiper";
import "swiper/css/bundle";
import "swiper/css";


const props = defineProps({
card:{
  type: Object,
  required: true,
  default: () => {}
}
})

const storeAuth = useStoreAuth()
const storeImages = useStoreImages()

const indexCount = ref(0)
const increaseIndex = () => {
indexCount.value++
}
const decreaseIndex = () => {
indexCount.value--
}
</script>
<style scoped>

.img{
width: 315px;
height: 299.26px;
border-radius: 10px;
object-fit: cover;
cursor: pointer;
margin-bottom: 10px;
animation: 3s ease-in 1s infinite reverse both running slidein;
}
.gray-text{
color: #717171;
margin: 5px 0;
}
.star-mini{
background-image: url('../../../assets/img/star-mini.svg');
width: 9px;
height: 9px;
margin-right: 5px;
display: inline-block;
}
.rating{
display: flex;
flex-direction: row;
justify-content: space-between;
}
h5{
display: inline-block;
}
.btn{
visibility: hidden;
}
.card-with-photo:hover .btn{
visibility: visible;
position: absolute;
border-radius: 20px;
padding: 9px 11px 7px 12px;
border: none;
background-color: #f8f8f8b2;
transition: background-color 1s cubic-bezier(.12,.38,.16,.74);
font:600 14px / 20px 'Roboto';
color: rgb(73, 73, 73)
}
.plus:hover, .minus:hover{
background-color: #ffffffe0 !important;
transform: scale(1.1 ,1.1);
padding: 0 10px 19px ;
}
.plus{
top: 33%;
right: 10px;
}
.minus{
top: 33%;
left: 10px;
}
.like-stay{
background-image: url('../../../assets/img/likeStay.svg');
width: 16.39px;
height: 16.39px;
position: absolute;
top: 15px;
right: 13px;
}
.dots{
border-radius: 20px;
padding: 3px;
margin: 0 5px;
border: none;
background-color: rgba(197, 197, 197, 0.884);
}
.dots-cont{
display: inline-block;
}
.fix-dots{
display: inline-block;
position: absolute;
top: 266px;
left: 116px;

}
.current-photo{
background-color: rgb(255, 255, 255);
}


.swiper-slide {
display: flex;
height: 300px;
justify-content: center;
align-items: center;
width: 50% !important;
margin: 0 25%;
font-size: 24px;
font-weight: 700;
}
.default-slider{
max-width: 30%;
margin:0
}
.swiper-slide-next{
overflow: hidden;
}
</style>