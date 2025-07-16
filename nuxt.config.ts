// https://nuxt.com/docs/api/configuration/nuxt-config
import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
  app:{
    head:{
      title: 'Scribbl',
      meta:[
        {name: 'description', content: 'Scribbl is a platform for creating and sharing your ideas.'}
      ],
      link:[
        {rel: 'icon', type: 'image/x-icon', href: '/Logo.svg'}
      ]
    }
  },
  compatibilityDate: '2025-05-15',
  future:{
    compatibilityVersion: 4,
  },
  devtools: { enabled: true },
  css:['~/assets/styles/global.css'],
  vite:{
    plugins:[tailwindcss()]
  },
  components:[
    {path: '~/src/components/ui', extensions: ['vue']}
  ],
  runtimeConfig:{
    public:{
      supabaseUrl: process.env.SUPABASE_URL,
      supabaseKey: process.env.SUPABASE_KEY
    }
  }
})
