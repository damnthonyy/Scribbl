<template>
    <div class="flex flex-col min-h-screen">
        <Header/>
        <main class="flex-1">
            <slot/>
        </main>
        <div class="flex justify-center p-[20px]">
            <Footer/>
        </div>
    </div>
</template>

<script setup lang="ts">
import Header from '~/components/ui/Header.vue';
import Footer from '~/components/ui/Footer.vue';
</script>