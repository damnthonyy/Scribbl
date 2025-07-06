<template>
    <main class="flex flex-col items-center justify-center gap-[30px] px-[20px] py-[40px]">
        <div class="flex flex-col items-center justify-center gap-[10px] text-center">
            <span class="text-[32px] md:text-[48px] font-medium sm:text-[21px]">
                ✍️ Minimaliste & clair
            </span>
            <span class="text-[20px] font-medium">
                Écrivez. Classez. Retrouvez.
            </span>
            <span class="text-[16px] font-500 font-weight-[500]">
                Un espace de prise de notes simple, rapide et rien que pour vous.
            </span>
        </div>
        <div class="flex flex-col sm:flex-row items-center gap-[15px] sm:gap-[20px]">
            <Button variant="primary" size="sm">
                <span>
                    Sign in
                </span>
            </Button>
            <Button variant="outline" size="sm">
                <span>
                    Sign up
                </span>
            </Button>
        </div>
    </main>
</template>

<script setup lang="ts">
import Button from '~/components/ui/Button.vue';

definePageMeta({
    layout: 'custom',
})
</script>

<style scoped>

</style>