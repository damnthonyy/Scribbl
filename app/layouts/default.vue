<template>
    <section class="flex p-y-[18px] p-x-[20px] align-center">
        <div class="w-full flex-none bg-red-200">
            <slot/>
        </div>
        <div class="w-full flex-1 bg-blue-200">
            <slot/>
        </div>
    </section>
</template>

<script setup lang="ts">

</script>