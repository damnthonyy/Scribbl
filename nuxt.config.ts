// https://nuxt.com/docs/api/configuration/nuxt-config
import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
  compatibilityDate: '2025-05-15',
  future:{
    compatibilityVersion: 4,
  },
  devtools: { enabled: true },
  css:['~/assets/styles/global.css'],
  vite:{
    plugins:[tailwindcss()]
  }
})
