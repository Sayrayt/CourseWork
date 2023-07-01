import {createApp} from 'vue'
import './style.css'
import App from './App.vue'
import vuetify from "./plugins/vuetify.js";
import router from "../router.js";
import {createPinia} from "pinia";

const pinia = createPinia()
createApp(App).use(router).use(pinia).use(vuetify).mount('#app')
