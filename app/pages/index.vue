<template>
    <main class="flex flex-col items-center justify-center gap-[30px] px-[20px] py-[40px]">
        <div class="flex flex-col items-center justify-center gap-[10px] text-center mt-[20vh]">
            <span class="text-[21px] sm:text-[21px] md:text-[48px] font-medium">
                ✍️ Minimaliste & clair
            </span>
            <span class="text-[20px] font-weight-[300] sm:text-[16px]">
                Écrivez. Classez. Retrouvez.
            </span>
            <span class="text-[14px] font-light">
                Un espace de prise de notes simple, rapide et rien que pour vous.
            </span>
        </div>
        <div class="flex justify-center align-center sm:flex items-center justify-center gap-[15px] md:gap-[20px]">
            <Button variant="primary" size="sm">
                <span>
                    Sign in
                </span>
            </Button>
            <NuxtLink to="/signUp">
                <Button variant="outline" size="sm">
                <span>
                    Sign up
                </span>
            </Button>
            </NuxtLink>

        </div>
    </main>
</template>

<script setup lang="ts">
import Button from '~/components/ui/BaseButton.vue';

definePageMeta({
    layout: 'custom',
})
</script>

<style scoped>

</style>