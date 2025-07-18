<script setup lang="ts">
definePageMeta({
    layout: 'custom',
})

import Button from '~/components/ui/BaseButton.vue'
import BaseInput from '~/components/ui/BaseInput.vue'
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

    // Validation des champs
    if (
        email.value.trim() === '' ||
        password.value.trim() === '' ||
        firstname.value.trim() === '' ||
        lastname.value.trim() === ''
    ) {
        error.value = 'Tous les champs sont obligatoires'
        loading.value = false
        return
    }

    if (password.value.length < 6) {
        error.value = 'Le mot de passe doit contenir au moins 6 caractères'
        loading.value = false
        return
    }

    try {
        //sign up user
        const { data: signUpData, error: signUpError } = await supabase.auth.signUp({
            email: email.value,
            password: password.value,
            options: {
                data: {
                    first_name: firstname.value,
                    last_name: lastname.value
                }
            }
        })

        if (signUpError) {
            error.value = signUpError.message || 'Erreur lors de l\'inscription'
            loading.value = false
            return
        }

        const userID = signUpData.user?.id

        if (!userID) {
            error.value = 'Erreur lors de la création de l\'utilisateur'
            loading.value = false
            return
        }

        //insert user data into users table
        const { error: userError } = await supabase.from('users').insert({
            id: userID,
            first_name: firstname.value,
            last_name: lastname.value,
            email: email.value,
            avatar_url: '',
        })

        if (userError) {
            error.value = userError.message || 'Erreur lors de l\'insertion des données utilisateur'
            loading.value = false
            return
        }

        success.value = 'Inscription réussie ! Vérifiez votre email pour confirmer votre compte.'
        
        //redirect to signin page after 2 seconds
        setTimeout(() => {
            return navigateTo('/signin')
        }, 2000)

    } catch (err) {
        error.value = 'Une erreur inattendue s\'est produite'
        console.error('Signup error:', err)
    } finally {
        loading.value = false
    }
}


</script>

<template>

    <section class="p-[20px] flex justify-center items-center">

        <form @submit.prevent="handleSignUp" class="flex flex-col gap-[24px] justify-center items-center w-[283px] pt-[100px]">
    
            <div class="flex flex-col gap-[8px]">
                <label for="email" class=" font-[500] text-[17px]">Email</label>
                <BaseInput 
                    id="email"
                    type="email" 
                    placeholder="john@doe.com" 
                    v-model="email"
                    class="mb-[10px]"
                />
            </div>
            
            <div class="flex flex-col gap-[8px]">
                <label for="password" class=" font-[500] text-[17px]">Password</label>
                <BaseInput 
                    id="password"
                    type="password" 
                    placeholder="********" 
                    v-model="password"
                    class="mb-[10px]"
                />
            </div>

            
            <div class="flex flex-col gap-[8px]">
                <label for="firstname" class=" font-[500] text-[17px]">Firstname</label>
                <BaseInput 
                    id="firstname"
                    type="firstname" 
                    placeholder="John" 
                    v-model="firstname"
                    class="mb-[10px]"
                />
            </div>
            
            <div class="flex flex-col gap-[8px]">
                <label for="lastname" class=" font-[500] text-[17px]">Lastname</label>
                <BaseInput 
                    id="lastname"
                    type="lastname" 
                    placeholder="Doe" 
                    v-model="lastname"
                    class="mb-[10px]"
                />
            </div>

            
            <Button variant="primary" type="submit" :disabled="loading" class="w-full">
                <span>
                    {{ loading ? 'Inscription en cours...' : 'Sign Up' }}
                </span>
            </Button>
            <p v-if="error" class="text-red-500 mt-[10px]">{{ error }}</p>
            <p v-if="success" class="text-green-500 mt-[10px]">{{ success }}</p>
        </form>
    </section>

</template>



