<template>
    <div class="relative w-full">
        <input 
        :type="getInputType()"
        :placeholder="props.placeholder"
        :disabled="props.disabled"
        :class="inputDisabledClasses"
        class="w-[283px] h-[43px] rounded-[8px] border border-[#BEBCBC] py-[10px] px-[10px]"
        :id="props.id"
        :value="modelValue"
        @input="handleInput"
    />
        <div class="absolute top-1/2 right-2 -translate-y-1/2">
            <slot name="icon"/>
        </div>
        
        <div v-if="props.error" class="text-[12px] text-red-500">
            <slot name="error"/>
        </div>

    </div>
    
</template>

<script setup lang="ts">
    interface PropsInput{
        type: 'email' | 'password' | 'lastname' | 'firstname' | 'text';
        placeholder: string;
        disabled?: boolean;
        error?: string;
        id?: string;
        modelValue?: string;
    }

    const props = withDefaults(defineProps<PropsInput>(),{
        type: 'email',
        placeholder: '',
        disabled: false,
        error: '',
        id: '',
        modelValue: '',
    })

    const emit = defineEmits<{
        'update:modelValue': [value: string]
    }>()

    const inputDisabledClasses = computed(()=>{
        return props.disabled ? 'opacity-50 cursor-not-allowed' : ''
    })

    const getInputType = () => {
        switch(props.type) {
            case 'email':
                return 'text'
            case 'password':
                return showPassword.value ? 'text' : 'password'
            case 'firstname':
            case 'lastname':
                return 'text'
            case 'text':
                return 'text'
            default:
                return 'text'
        }
    }

    const handleInput = (event: Event) => {
        const target = event.target as HTMLInputElement
        emit('update:modelValue', target.value)
    }

    const password = ref('')
    const showPassword = ref(false)
    
    const togglePasswordVisibility = ()=>{
        showPassword.value = !showPassword.value
    }
</script>