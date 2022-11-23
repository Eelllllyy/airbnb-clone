<template>
  <div>
    <div class="section">
      <div class="block-inf">
        <h2>Hidden Haven - 5 Bed Villa with pool & Sea Views</h2>
        <div class="place-description">
          <div class="plDec-one">
            <div>
              <div class="star" />
              <h4>5.0</h4>
              <h4>·</h4>
              <h4>3 reviews</h4>
              <p style="padding-left: 10px">
                ·
              </p>
              <p style="padding: 0 20px">
                Superhost
              </p>
              <p style="padding-right: 8px">
                ·
              </p>
              <h4 style="text-decoration: underline">
                Cape Town, Western Cape, South Africa
              </h4>
            </div>
          </div>
          <div class="plDec-two">
            <div>
              <div class="share" />
              <h4>Share</h4>
            </div>
            <div>
              <div class="like" />
              <h4>Save</h4>
            </div>
          </div>
        </div>
        <div />
      </div>
      <div class="block-picture">
        <div class="cont-fot-pict-1">
          <div class="img-1" />
        </div>
        <div class="cont-fot-pict-2">
          <div class="img-2" />
          <div class="img-3" />
          <div class="img-4" />
          <div class="img-5" />
        </div>
      </div>
    </div>
  </div>
</template>
<script setup></script>
<style scoped>
.section {
  width: 59%;
  margin: 0 auto;
}
.place-description,
.plDec-one,
.plDec-two {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin: 10px 0;
  /* word-spacing: 3px; */
}
h4,
p,
.star,
.share,
.like,
.img-1,
.img-2,
.img-3,
.img-4,
.img-5 {
  display: inline-block;
}
.star {
  background-image: url('../../../assets/img/star.svg');
  width: 13.79px;
  height: 13.16px;
  margin-right: 5px;
}
.share {
  background-image: url('../../../assets/img/share.svg');
  width: 16px;
  height: 16px;
  margin-right: 8px;
}
.like {
  background-image: url('../../../assets/img/like.svg');
  width: 16px;
  height: 16px;
  margin: 0 8px 0 15px;
}
.block-picture,
.cont-fot-pict-2 {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-between;
}
.cont-fot-pict-1 {
  width: 48%;
}
.cont-fot-pict-2 {
  width: 48%;
}
.img-1 {
  background-image: url('../../../assets/img/img1.png');
  width: 560px;
  height: 560px;
}
.img-2 {
  background-image: url('../../../assets/img/img2.png');
  width: 272px;
  height: 280px;
  width: 49%;
}
.img-3 {
  background-image: url('../../../assets/img/img3.png');
  width: 272px;
  height: 280px;
  width: 50%;
}
.img-4 {
  background-image: url('../../../assets/img/img4.png');
  width: 272px;
  height: 280px;
  width: 49%;
}
.img-5 {
  background-image: url('../../../assets/img/img5.png');
  width: 272px;
  height: 280px;
  width: 50%;
}
</style>
