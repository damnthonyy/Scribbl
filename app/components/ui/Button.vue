<script setup lang="ts">
    import { computed } from 'vue';

    enum Variant{
        primary = 'primary',
        outline= 'outline',
    }

    enum Size{
        sm = 'sm',
        md = 'md',
    }

    interface PropsButton{
        type?: 'button' | 'submit' | 'reset';
        variant?: keyof typeof Variant;
        size?: keyof typeof Size;
        icon?:string;
    }

    const props = withDefaults(defineProps<PropsButton>(),{
        type: 'button',
        variant: Variant.primary,
        size: Size.md,
        icon: '',
    })

    const buttonVariantClasses = computed(()=>{
        const variant ={
            [Variant.primary]:'bg-black text-white',
            [Variant.outline]:'bg-white text-black border border-black',
        }
        return variant[props.variant]
    })

    const buttonSizeClasses = computed(()=>{
        const size ={
            [Size.sm]:' w-[120px] h-[41px]',
            [Size.md]:' w-[190px] h-[60px]',
        }
        return size[props.size]
    })

</script>


<template>
    <button :class="[buttonVariantClasses, buttonSizeClasses]" :type="props.type" class="rounded-[8px]">
        <span class="flex items-center justify-center">
            <slot/>
        </span>
    </button>
</template>

