import 'vuetify/styles'
import {createVuetify} from 'vuetify'
import {mdi, aliases} from 'vuetify/iconsets/mdi-svg'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

const vuetify = createVuetify({
    components,
    directives,
    icons: {
        defaultSet: 'mdi',
        aliases: {
            ...aliases,
        },
        sets: {
            mdi,
        },
    },
})
export default vuetify
