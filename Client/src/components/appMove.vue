<template>
  <v-col cols="12" :sm="6" :md="6" :lg="4">
    <v-card>
      <v-img
          class="align-end text-white"
          height="200"
          src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
          cover
      >
        <v-card-title style="white-space: normal">{{ move.name }}</v-card-title>
      </v-img>
      <div class="position-absolute" style="top: 10px; right: 10px;">
        <v-btn class="mr-2" size="x-small" @click="favorite()" icon>
          <v-icon :color="isFavorite ? 'yellow-accent-4' : 'black'">{{ isFavorite ? mdiBookmark : mdiBookmarkOutline }}</v-icon>
        </v-btn>
        <v-btn class="mr-2" size="x-small" @click="viewed()" icon>
          <v-icon :color="isViewed ? 'green' : 'black'">{{ isViewed ? mdiClockCheck : mdiClockPlus }}</v-icon>
        </v-btn>
      </div>
      <v-card-subtitle class="pt-2">
        {{ move.country + ", " + move.genre }}
      </v-card-subtitle>
      <v-card-text class="pb-0">
        <v-row
            align="center"
            class="mx-0"
        >
          <v-rating
              :model-value="4.5"
              color="amber"
              density="compact"
              half-increments
              readonly
              size="small"
          ></v-rating>

          <div class="text-grey ms-4">
            4.5 (413)
          </div>
        </v-row>
        <div class="my-4 text-subtitle-1">
          Небольшое описание фильма
        </div>
      </v-card-text>
    </v-card>
  </v-col>
</template>

<script setup>
import {mdiBookmark, mdiBookmarkOutline, mdiClock, mdiClockCheck, mdiClockPlus} from "@mdi/js";
import {useMoveStore} from "../stores/move.js";
import {computed, ref} from "vue";

const props = defineProps({
  moveInfo: Object
})

const move = ref(props.moveInfo)

const moveStore = useMoveStore()
const isFavorite = computed(() => moveStore.favorite.indexOf(move.value.id) !== -1)
const isViewed = computed(() => moveStore.viewed.indexOf(move.value.id) !== -1)
const favorite = () => {
  moveStore.setFavorite(move.value.id)
}
const viewed = () => {
  moveStore.setViewed(move.value.id)
}
</script>
