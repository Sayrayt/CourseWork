import {createRouter, createWebHistory} from 'vue-router';
import appProfile from "./src/components/appProfile.vue";
import appMoves from "./src/components/appMoves.vue";

const routes = [
    {
        path: '/',
        component: appMoves,
        name: 'home'
    },
    {
        path: '/profile',
        component: appProfile,
        name: 'profile',
        children: [
            {
                path: 'login',
                name: 'login',
                component: appProfile,
            },
            {
                path: 'registration',
                name: 'registration',
                component: appProfile,
            },
        ]
    },
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router
