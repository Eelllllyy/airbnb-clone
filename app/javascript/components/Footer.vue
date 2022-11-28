<template>
  <footer class="footer">
    <section class="section">
      <div>
        <p>© 2022 Airbnb, Inc.</p>
        <p class="point">
          ·
        </p>
        <p>Privacy</p>
        <p class="point">
          ·
        </p>
        <p>Terms</p>
        <p class="point">
          ·
        </p>
        <p>Sitemap</p>
        <p class="point">
          ·
        </p>
        <p>Destinations</p>
      </div>
      <div>
        <div class="lang-cont">
          <div class="lang" />
        </div>
        <p class="invisible">
          English (US)
        </p>
        <p>Support & resources</p>
      </div>
    </section>
  </footer>
</template>
<style scoped>
.footer{
  display: block !important ;
  position: sticky;
  bottom: 0;
  z-index: 0;
  background-color: white;
}

.section{
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  flex-direction: row;
  padding: 20px 0;
  width: 95%;
  margin: 0 auto;
}
p{
  display: inline;
}
.point{
  margin: 0 7px;
}
.lang-cont{
  position: relative;
}
.lang{
  background-image: url('../../../assets/img/lang.svg');
  width: 16px;
  height: 16px;
  display: inline-block;
  position: absolute;
  left: 0;
}
.invisible{
  padding: 0 25px
}
</style>