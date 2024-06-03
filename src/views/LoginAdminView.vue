<template>
  <div class="bg-admin flex justify-center flex-col">
    <div class="flex justify-between px-8">
      <router-link
      to="/"
      class="text-white hover:text-gray-400 inline-block my-8 mb-12 items-start"
    >
      <svg
        class="w-6 h-6"
        fill="none"
        stroke="currentColor"
        viewBox="0 0 24 24"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M15 19l-7-7 7-7"
        ></path>
      </svg>
    </router-link>
    <h1 class="py-8 text-4xl text-white font-bold">PetCare Shop <span class=" text-xs font-medium">admin</span></h1>
    </div>
    <div class="w-full bg-white rounded-t-semifulladmin p-8">
      <div class="flex justify-center mb-8">
        <img src="@/assets/icon/Logo Petshop Emas.svg" alt="PetCare Shop Logo" class="w-24 h-24" />
      </div>
      <h2 class="text-2xl font-bold text-center mb-4">Login</h2>
      <p class="text-center text-gray-600 mb-6">Silahkan login untuk melanjutkan</p>
      <form @submit.prevent="login" class="space-y-6">
        <div v-if="errorMessage" class="text-red-500 text-center mb-4">
          {{ errorMessage }}
        </div>
        <div>
          <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
          <input
            type="text"
            v-model="email"
            id="username"
            class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-admin focus:border-admin sm:text-sm"
            required
          />
        </div>
        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
          <input
            type="password"
            v-model="password"
            id="password"
            class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-admin focus:border-admin sm:text-sm"
            required
          />
        </div>
        <button
          type="submit"
          class="w-full bg-admin text-white py-2 px-4 rounded-md hover:bg-adminHover font-bold"
        >
          Login
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      email: "",
      password: "",
      errorMessage: "",
    };
  },
  methods: {
    login() {
      // Coba login pengguna terlebih dahulu
      axios
        .post("http://localhost:3000/api/login", {
          email: this.email,
          password: this.password,
        })
        .then((response) => {
          console.log(response.data);
          this.$router.push("/dashboard"); // Redirect to user dashboard after successful login
        })
        .catch(() => {
          // Jika login pengguna gagal, coba login admin
          axios
            .post("http://localhost:3000/api/admin/login", {
              username: this.email,
              password: this.password,
            })
            .then((response) => {
              console.log(response.data);
              this.$router.push("/dashboardadmin"); // Redirect to admin dashboard after successful login
            })
            .catch((error) => {
              console.error("Error logging in:", error.response.data);
              this.errorMessage = "Username atau Password salah";
            });
        });
    },
  },
};
</script>

<style scoped>
/* Tambahan style jika diperlukan */
</style>
