<script setup lang="ts">
definePageMeta({
    layout: 'custom',
})

import Button from '~/components/ui/BaseButton.vue'
import { SupabaseClient } from '@supabase/supabase-js'
import { navigateTo } from '#app'

const email = ref('')
const password = ref('')
const firstname = ref('')
const lastname = ref('')
const router = useRouter()
const loading = ref(false)
const success = ref('')
const error = ref('')
const nuxtApp = useNuxtApp()
const supabase = nuxtApp.$supabase as SupabaseClient


const handleSignUp = async () => {
    loading.value = true
    success.value = ''
    error.value = ''

    //sign up user
    const { data: signUpData, error: signUpError } = await supabase.auth.signUp({
        email: email.value,
        password: password.value
    })
    loading.value = false

    if (signUpError) {
        error.value = signUpError.message || 'error signing up'
        return
    }

    const userID = signUpData.user?.id

    //insert user data into users table
    const { error: userError } = await supabase.from('users').insert({
        id:userID,
        first_name: firstname.value,
        last_name: lastname.value,
        email: email.value,
        avatar_url:'',
    })

    if (userError){
        error.value = userError.message || 'error inserting user data'
        return
    }

    //redirect to signin page
    return navigateTo('/signin')


}



</script>

<template>

    <section class="p-[20px]">
        <h1>Sign Up</h1>
        <form @submit.prevent="handleSignUp" class="flex flex-col">
            <input class="w-[240px] h-[40px] border-1 border-black rounded-md mb-[10px] p-[10px]" type="email" placeholder="Email" v-model="email"/>
            <input class="w-[240px] h-[40px] border-1 border-black rounded-md mb-[10px] p-[10px]" type="password" placeholder="Password" v-model="password"/>
            <input class="w-[240px] h-[40px] border-1 border-black rounded-md mb-[10px] p-[10px]" type="firstname" placeholder="First Name" v-model="firstname"/>
            <input class="w-[240px] h-[40px] border-1 border-black rounded-md mb-[10px] p-[10px]" type="lastname" placeholder="Last Name" v-model="lastname"/>
            <Button variant="primary" size="md" type="submit">
                <span>
                    Sign Up
                </span>
            </Button>
            <p v-if="error" class="text-red-500">{{ error }}</p>
        </form>
    </section>

</template>



