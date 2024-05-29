<template>
  <nav class="bg-back py-4 px-6 flex items-center justify-between">
    <!-- Logo Home -->
    <router-link to="/">
      <img :src="homeIcon" alt="Home" class="w-12 h-12" />
    </router-link>

    <!-- Logo Kategori -->
    <router-link to="/categories">
      <img :src="categoriesIcon" alt="Kategori" class="w-12 h-12" />
    </router-link>

    <!-- Logo Pembayaran -->
    <router-link to="/payment">
      <img :src="paymentIcon" alt="Pembayaran" class="w-12 h-12" />
    </router-link>

    <!-- Logo Akun -->
    <router-link to="/account">
      <img :src="accountIcon" alt="Akun" class="w-12 h-12" />
    </router-link>
  </nav>
</template>

<script>
import homeIcon from '@/assets/icon/Home Biru.svg';
import categoriesIcon from '@/assets/icon/Navbar Hitam.svg';
import paymentIcon from '@/assets/icon/Payment Hitam.svg';
import accountIcon from '@/assets/icon/Profil Hitam.svg';

export default {
  data() {
    return {
      homeIcon,
      categoriesIcon,
      paymentIcon,
      accountIcon
    };
  }
};
</script>

<style scoped>
/* Styling untuk komponen navbar */
/* Ganti ukuran dan gaya sesuai preferensi Anda */
img {
  width: 2rem;
  height: 2rem;
}
</style>
