<template>
  <footer class="footer">
    <section class="section-one">
      <div class="block">
        <h4>Support</h4>
        <p class="pointer">
          Help Center
        </p>
        <p class="pointer">
          AirCover
        </p>
        <p class="pointer">
          Supporting people with disabilities
        </p>
        <p class="pointer">
          Cancellation options
        </p>
        <p class="pointer">
          Our COVID-19 Response
        </p>
        <p class="pointer">
          Report a neighborhood concern
        </p>
      </div>
      <div class="block">
        <h4>Community</h4>
        <p class="pointer">
          Airbnb.org: disaster relief housing
        </p>
        <p class="pointer">
          Combating discrimination
        </p>
        <p class="hidden">
          .
        </p>
        <p class="hidden">
          .
        </p>
        <p class="hidden">
          .
        </p>
        <p class="hidden">
          .
        </p>
      </div>
      <div class="block">
        <h4>Hosting</h4>
        <p class="pointer">
          Airbnb your home
        </p>
        <p class="pointer">
          AirCover for Hosts
        </p>
        <p class="pointer">
          Explore hosting resources
        </p>
        <p class="pointer">
          Visit our community forum
        </p>
        <p class="pointer">
          How to host responsibly
        </p>
        <p class="hidden">
          .
        </p>
      </div>
      <div class="block">
        <h4>Airbnb</h4>
        <p class="pointer">
          Newsroom
        </p>
        <p class="pointer">
          Learn about new features
        </p>
        <p class="pointer">
          Letter from our founders
        </p>
        <p class="pointer">
          Careers
        </p>
        <p class="pointer">
          Investors
        </p>
        <p class="pointer">
          Gift cards
        </p>
      </div>
    </section>
    <div class="line-gray" />
    <section class="section-two">
      <div>
        <p>© 2022 Airbnb, Inc.</p>
        <p class="dats">
          ·
        </p>
        <p class="pointer">
          Privacy
        </p>
        <p class="dats">
          ·
        </p>
        <p class="pointer">
          Terms
        </p>
        <p class="dats">
          ·
        </p>
        <p class="pointer">
          Sitemap
        </p>
        <p class="dats">
          ·
        </p>
        <p class="pointer">
          Destinations
        </p>
      </div>
      <div>
        <div class="lang-container">
          <div class="lang" />
        </div>
        <p class="unvis pointer">
          English (US)
        </p>
        <p class="pointer">
          Support & resources
        </p>
        <div class="block-icon">
          <div class="icon-facebook pointer" />
          <div class="icon-twitter pointer" />
          <div class="icon-instagram pointer" />
        </div>
      </div>
    </section>
  </footer>
</template>
<script setup>
</script>
<style scoped>
.footer{
width: 100%;
background: #F7F7F7;
}
.section-one{
  width: 59%;
  height: 370px;
  margin: 0 auto;
  padding: 49px 0;
  display: flex;
  flex-direction: row;
  justify-content: space-between;}
.block{
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.section-two{
  width: 59%;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  flex-direction: row;
  padding: 20px 0;
}
.hidden{
  visibility: hidden;
}
.line-gray{
  border: 1px solid #DDDDDD;
  height: 1px;
  width: 59%;
  margin: 0 auto;
}
p{
  display: inline;
}
.dats{
  margin:0 7px;
}
.lang-container{
  position: relative;
}
.lang{
  background-image: url('../../../assets/img/lang.svg');
  width: 16px;
  height: 16px;
  display: inline-block;
  position: absolute;
  left:0;
}
.unvis{
  padding:0 25px
}
.icon-facebook{
  background-image: url('../../../assets/img/facebook.svg');
  width: 19px;
  height: 18px;
  display: inline-block;
  position: absolute;
  left:0
}
.icon-twitter{
  background-image: url('../../../assets/img/twitter.svg');
  width: 19px;
  height: 19px;
  display: inline-block;
  position: absolute;
  left:40px
}
.icon-instagram{
  background-image: url('../../../assets/img/Instagram.svg');
  width: 19px;
  height: 18px;
  display: inline-block;
  position: absolute;
  left:80px
}
.block-icon{
  display: inline-block;
  position: relative;
  width: 100px;
  height: 14px;
  margin-left: 30px ;
}
.pointer{
  cursor: pointer;
}
.pointer:hover{
  text-decoration: underline;
}
</style>