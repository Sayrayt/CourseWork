<template>
  <v-toolbar
      class="px-3"
      color="white"
      flat
      density="comfortable"
  >
    <v-toolbar-title class="text-h5">
      <router-link to="/" class="text-decoration-none text-black">Coursework</router-link>
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-fade-transition>
      <v-btn v-if="!route.path.includes('profile')" :to="userStore.userToken ? '/profile' : '/profile/login'" :icon="mdiAccount"></v-btn>
    </v-fade-transition>
  </v-toolbar>
</template>

<script setup>
import {mdiAccount} from "@mdi/js";
import {useRoute} from "vue-router";
import {useUserStore} from "../stores/user.js";

const route = useRoute()
const userStore = useUserStore()

</script>
