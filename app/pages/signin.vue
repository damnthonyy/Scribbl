<script setup lang="ts">
definePageMeta({
    layout: 'custom',
})
import BaseInput from '~/components/ui/BaseInput.vue';
import Button from '~/components/ui/BaseButton.vue';
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { SupabaseClient } from '@supabase/supabase-js';

const supabase = useNuxtApp().$supabase as SupabaseClient

const showPassword = ref(false);

const togglePasswordVisibility = () => {
    showPassword.value = !showPassword.value;
}

const email = ref('');
const password = ref('');
const error = ref('')
const loading = ref(false)
const handleSignIn = async () => {
    error.value = ''
    loading.value = true
    const {data, error:signInError} = await supabase.auth.signInWithPassword({
        email: email.value,
        password: password.value
    })
    if(signInError){
        error.value = signInError.message
    }
    loading.value = false
    return navigateTo('/dashboard')
}


</script>

<template>
    <section class="flex flex-col items-center justify-center">
        <form @submit.prevent="handleSignIn" class="flex flex-col gap-[24px] justify-center items-center w-[283px] pt-[100px]">
            <div class="flex flex-col gap-[8px]">
                <label for="email" class=" font-[500] text-[17px]">Email</label>
            <BaseInput 
                id="email"
                v-model="email"
                type="email"
                placeholder="John@gmail.com"
                class="mb-[10px]"
            />
            </div>
            <div class="flex flex-col gap-[8px]">
                <label for="password" class=" font-[500] text-[17px]">Password</label>
                <BaseInput 
                    id="password"
                    v-model="password"
                    :type="showPassword ? 'text' : 'password'"
                    placeholder="********"
                    class="mb-[10px]"
                >
                    <template #icon>
                        <button type="button" @click="togglePasswordVisibility" class="absolute top-1/2 right-2 -translate-y-1/2 bg-transparent border-none w-[20px] h-[20px] cursor-pointer" >
                            <Icon :name="showPassword ? 'mdi:eye-off' : 'mdi:eye'" class="w-full h-full text-gray-500 hover:text-black"/>
                        </button>
                    </template>
                </BaseInput>
            </div>
            <Button variant="primary" type="submit" class="w-full">
                {{ loading ? 'Loading...' : 'Sign in' }}
            </Button>
            <p v-if="error" class="text-red-500 text-[14px]">{{ error }}</p>
        </form>
    </section>
</template>