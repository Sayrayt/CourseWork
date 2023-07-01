<script setup>
import AppHeader from "./components/appHeader.vue";
</script>

<template>
  <app-header/>
  <router-view v-slot="{ Component, route }">
    <v-fade-transition mode="out-in">
      <v-container class="pt-16" :key="route.path">
        <component :is="Component"></component>
      </v-container>
    </v-fade-transition>
  </router-view>
</template>
