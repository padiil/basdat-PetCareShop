<template>
  <div class="bg-primary">
    <router-link
      to="/"
      class="text-white hover:text-gray-400 inline-block my-8 mb-12 mx-4"
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
    <div
      class="bg-white flex flex-col items-center justify-center p-4 pt-16 rounded-tr-semifull"
    >
      <div class="w-full max-w-md">
        <div class="flex flex-col items-center">
          <img
            src="@/assets/logo.svg"
            alt="PetCare Shop Logo"
            class="w-32 h-32 mb-4"
          />
          <h2 class="text-2xl font-bold mb-2">Login</h2>
          <p class="mb-6 text-gray-600">Silahkan login untuk melanjutkan</p>
          <form @submit.prevent="login" class="w-full">
            <div v-if="errorMessage" class="mb-4 text-red-500">
              {{ errorMessage }}
            </div>
            <div class="mb-4">
              <label for="email" class="block text-sm font-medium text-gray-700"
                >Email</label
              >
              <input
                type="email"
                v-model="email"
                id="email"
                class="mt-1 block w-full border border-gray-300 rounded-xl shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary sm:text-sm"
                required
              />
            </div>
            <div class="mb-6">
              <label
                for="password"
                class="block text-sm font-medium text-gray-700"
                >Password</label
              >
              <input
                type="password"
                v-model="password"
                id="password"
                class="mt-1 block w-full border border-gray-300 rounded-xl shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary sm:text-sm"
                required
              />
            </div>
            <button
              type="submit"
              class="w-full bg-primary text-white py-2 px-4 rounded-xl hover:bg-primaryHover"
            >
              Login
            </button>
          </form>
          <p class="mt-4 text-gray-600">
            Belum punya akun?
            <router-link
              to="/register"
              class="text-primary hover:text-primaryHover"
              >Daftar disini</router-link
            >
          </p>
        </div>
      </div>
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
      axios
        .post("http://localhost:3000/api/login", {
          email: this.email,
          password: this.password,
        })
        .then((response) => {
          console.log(response.data);
          this.$router.push("/dashboard"); // Redirect to another page after successful login
        })
        .catch((error) => {
          console.error("Error logging in:", error.response.data);
          this.errorMessage = error.response.data;
        });
    },
  },
};
</script>

<style scoped>
/* Tambahan style jika diperlukan */
</style>
