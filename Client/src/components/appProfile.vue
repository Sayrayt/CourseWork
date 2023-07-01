<template>
  <v-row v-if="namedRoute.id !== 2" style="min-height: 600px" align-content="center" justify="center">
    <v-col cols="12">
      <h1 class="text-center">{{ namedRoute.title }}</h1>
      <v-sheet max-width="400" class="mx-auto mt-3">
        <v-form fast-fail @submit.prevent="entry">
          <v-text-field variant="outlined" hide-details clearable label="Логин"></v-text-field>

          <v-text-field v-if="namedRoute.id === 1" class="mt-3" variant="outlined" hide-details clearable
            label="Имя"></v-text-field>

          <v-text-field class="mt-3" variant="outlined" hide-details type="password" clearable
            label="Пароль"></v-text-field>
          <v-text-field v-if="namedRoute.id === 1" class="mt-3" variant="outlined" hide-details type="password" clearable
            label="Повторите пароль"></v-text-field>
          <div class="mt-6">
            <v-btn type="submit" color="primary" block>{{ namedRoute.id === 0 ? "Войти" : "Зарегистрироваться" }}
            </v-btn>
          </div>
        </v-form>
        <div class="mt-2">
          <p v-if="namedRoute.id !== 1" class="text-body-2">Нет аккаунта?
            <router-link :to="{ name: 'registration' }">Зарегистрируйтесь</router-link>
          </p>
          <p v-else class="text-body-2">Есть аккаунт?
            <router-link :to="{ name: 'login' }">Войти</router-link>
          </p>
        </div>
      </v-sheet>
    </v-col>
  </v-row>
  <div v-else>
    <div class="text-center mb-8">
      <h1 class="text-h4">Профиль</h1>
    </div>
    <v-card class="mx-auto text-left pa-3 " max-width="600">
      <div class="d-flex align-start justify-space-around">
        <v-avatar size="160">
          <v-img cover src="https://cdn.vuetifyjs.com/images/profiles/marcus.jpg"></v-img>
        </v-avatar>

        <div class="">
          <v-list-item title="Иван Иванов" subtitle="страна, статус, и какая-нибудь общая информация"></v-list-item>
          <v-card-text class="pt-1 text-right d-flex">
            <div class="d-flex align-center mr-2">
              <v-icon color="yellow-accent-4" class="mr-1">{{ mdiBookmark }}</v-icon>
              {{ moveStore.favorite.length }}
            </div>
            <div class="d-flex align-center ">
              <v-icon color="green" class="mr-1">{{ mdiClockCheck }}</v-icon>
              {{ moveStore.viewed.length }}
            </div>
          </v-card-text>
        </div>
      </div>

      <v-textarea hide-details class="mt-6" label="Информация о себе" variant="solo-filled"></v-textarea>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn @click="exit" color="error" variant="outlined" width="100">
          Выйти
        </v-btn>
      </v-card-actions>
    </v-card>
    <v-fade-transition group mode="out-in">
      <template v-if="moveStore.viewed.length > 0 || moveStore.favorite.length > 0">
        <div class="text-center my-8">
          <h1 class="text-h5">Отмеченные фильмы</h1>
        </div>
        <v-row>
          <v-fade-transition group mode="out-in">
            <app-move v-for="move in moveStore.markedMoves" :key="move.id" :moveInfo="move" />
          </v-fade-transition>
        </v-row>
      </template>
    </v-fade-transition>
  </div>
</template>
  

<script setup>
import { useRoute, useRouter } from "vue-router";
import { computed } from "vue";
import AppMove from "./appMove.vue";
import { useMoveStore } from "../stores/move.js";
import { mdiBookmark, mdiClockCheck } from "@mdi/js";
import { useUserStore } from "../stores/user.js";

const route = useRoute()
const moveStore = useMoveStore()
const userStore = useUserStore()
const entry = () => {
  userStore.setUserToken('asdasdasdasdasd')
  router.push("/")
}
const router = useRouter()

const exit = () => {
  userStore.setUserToken(null)
  localStorage.clear()
  router.push("/")
}


const namedRoute = computed(() => {
  switch (route.path) {
    case '/profile/login':
      return { title: "Авторизация", name: "login", id: 0 }

    case '/profile/registration':
      return { title: "Регистрация", name: "registration", id: 1 }

    case '/profile':
      return { title: "Профиль", name: "profile", id: 2 }
    default:
      return { title: "Авторизация", name: "login", id: 1 }
  }
})
</script>
