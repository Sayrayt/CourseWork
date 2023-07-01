import {defineStore} from "pinia";

export const useUserStore = defineStore('user', {
    state: () => ({
        userToken: localStorage.getItem('userToken') ?? null,
    }),

    actions: {
        setUserToken(newToken) {
            this.userToken = newToken
            if (newToken) {
                localStorage.setItem('userToken', newToken)
            } else {
                localStorage.removeItem('userToken')
            }
        },
    }
})
