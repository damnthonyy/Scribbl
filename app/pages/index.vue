<template>
    <main class="flex flex-col items-center justify-center gap-[30px]">
        <div class="flex flex-col items-center justify-center gap-[10px]">
            <span class="text-[48px] font-medium">
                ✍️ Minimaliste & clair
            </span>
            <span class="text-[20px] font-medium">
                Écrivez. Classez. Retrouvez.
            </span>
            <span class="text-[16px] font-500 font-weight-[500]">
                Un espace de prise de notes simple, rapide et rien que pour vous.
            </span>
        </div>
        <div class="flex items-center gap-[20px] ">
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