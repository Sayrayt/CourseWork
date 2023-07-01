<script setup>
import AppMove from "./appMove.vue";
import {useMoveStore} from "../stores/move.js";

const moveStore = useMoveStore()
</script>

<template>
  <div class="text-center mb-8">
    <h1 class="text-h4">Популярные фильмы</h1>
  </div>
  <v-row>
    <v-fade-transition group>
      <app-move v-for="move in moveStore.moves" :key="move.id" :moveInfo="move"/>
    </v-fade-transition>
  </v-row>

  <v-fade-transition group mode="out-in">
    <template v-if="moveStore.viewed.length > 0">
      <div class="text-center my-8">
        <h1 class="text-h4">Просмотренные фильмы</h1>
      </div>
      <v-row>
        <v-fade-transition group mode="out-in">
          <app-move v-for="move in moveStore.viewedMoves" :key="move.id" :moveInfo="move"/>
        </v-fade-transition>
      </v-row>
    </template>
  </v-fade-transition>

  <v-fade-transition group mode="out-in">
    <template v-if="moveStore.favorite.length > 0">
      <div class="text-center my-8">
        <h1 class="text-h4">Избранные фильмы</h1>
      </div>
      <v-row>
        <v-fade-transition group>
          <app-move v-for="move in moveStore.favoriteMoves" :key="move.id" :moveInfo="move"/>
        </v-fade-transition>
      </v-row>
    </template>
  </v-fade-transition>
</template>
