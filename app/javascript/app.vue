<template>
  <v-main>
    <v-app id="app"> 
      <v-btn>Vuetifyのボタン</v-btn> 
      <slot>なし</slot>
    </v-app> 
  </v-main>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
