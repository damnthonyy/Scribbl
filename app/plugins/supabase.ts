import { createClient } from '@supabase/supabase-js'

defineNuxtPlugin(() => {
const supabaseUrl = process.env.SUPABASE_URL || '' 
const supabaseKey = process.env.SUPABASE_KEY || ''
const supabase = createClient(supabaseUrl, supabaseKey)

return {
    provide: {
        supabase,
    },
}
})
