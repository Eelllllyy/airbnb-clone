<template>
  <Swiper
    class="swiper"
    :slides-per-view="1"
    :modules="[Navigation, Pagination , Virtual]"
    navigation
    :pagination="{clickable:true, dynamicBullets: true}"
    grab-cursor
  >
    <SwiperSlide v-for="photo in card.photos">
      <img
        class="img"
        :src="photo.url"
        alt="avatar"
        @click="goToStay(card.id)"
      >
    </SwiperSlide>
  </Swiper>

  <div class="rating">
    <h5 @click="goToStay(card.id)">
      {{ card.location }}
    </h5>
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
import {useStoreAuth, useStoreImages} from '@/store/store'
import {useRouter} from 'vue-router'
import {Swiper, SwiperSlide} from "swiper/vue";
import {Navigation, Pagination, Virtual} from "swiper";
import "swiper/css/bundle";
import "swiper/css";

const router = useRouter()
const goToStay = (id) => {
  router.push(`/stays/${id}`)
}
const props = defineProps({
  card: {
    type: Object,
    required: true,
    default: () => {
    }
  }
})

const storeAuth = useStoreAuth()
const storeImages = useStoreImages()


</script>
<style scoped>

.img {
  width: 315px;
  height: 299.26px;
  border-radius: 10px;
  object-fit: cover;
  cursor: pointer;
  margin-bottom: 10px;
  animation: 3s ease-in 1s infinite reverse both running slidein;
}

.gray-text {
  color: #717171;
  margin: 5px 0;
}

.star-mini {
  background-image: url('../../../assets/img/star-mini.svg');
  width: 9px;
  height: 9px;
  margin-right: 5px;
  display: inline-block;
}

.rating {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  cursor: pointer;
}

h5 {
  display: inline-block;
}

.like-stay {
  background-image: url('../../../assets/img/likeStay.svg');
  width: 16.39px;
  height: 16.39px;
  position: absolute;
  top: 15px;
  right: 13px;
  z-index: 2;
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

.swiper-slide-next {
  overflow: hidden;
}

.swiper{
  --swiper-theme-color:#ffffff;
  --swiper-navigation-size:20px;
  font-weight: 600;
}

</style>
