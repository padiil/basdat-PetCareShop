<template>
  <div class="flex flex-col items-center justify-center min-h-screen bg-back">
    <img src="@/assets/logo.svg" alt="PetCare Shop Logo" class=" w-32 h-32 mb-6" />
    <h1 class="text-4xl font-bold mb-4 text-center">Selamat datang di PetCare Shop</h1>
    <div class="flex flex-col items-center space-y-4">
      <div class="text-center">
        <p class="mb-2 text-xs">Silahkan Login</p>
        <router-link to="/login">
          <button class="w-48 bg-primary font-bold text-white py-2 px-4 rounded-xl hover:bg-primaryHover">
            Login
          </button>
        </router-link>
      </div>
      <div class="text-center">
        <p class="mb-2 text-xs">Belum punya akun?</p>
        <router-link to="/register">
          <button class="w-48 bg-secondary font-bold text-white py-2 px-4 rounded-xl hover:bg-secondaryHover">
            Daftar
          </button>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
};
</script>

<style scoped>
/* Tambahan style untuk mengatur ukuran logo jika diperlukan */
</style>
