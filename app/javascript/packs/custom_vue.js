// 自分でvue.jsをカスタマイズしてみる

import Vue from 'vue'
import Vuetify from "vuetify"; // 追加
import "vuetify/dist/vuetify.min.css"; // 追加
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#hello2',
    data: {
      message: "聞こえますか？これはvue.jsなのです。htmlの書き込みではありません"
    },
    components: { App }
  })
})