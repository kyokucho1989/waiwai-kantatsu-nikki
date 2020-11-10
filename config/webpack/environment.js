const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment

// vuetify error対策
// https://github.com/vuetifyjs/vuetify/discussions/4068
environment.config.merge({
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  }
})
