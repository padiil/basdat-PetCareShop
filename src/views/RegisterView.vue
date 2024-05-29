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
      class="bg-white flex flex-col items-center justify-center p-4 py-16 rounded-tr-semifull"
    >
      <div class="w-full max-w-md">
        <div class="flex flex-col items-center">
          <img
            src="@/assets/logo.svg"
            alt="PetCare Shop Logo"
            class="w-32 h-32 mb-4"
          />
          <h2 class="text-2xl font-bold mb-2">Buat Akun Baru</h2>
          <p class="mb-6 text-gray-600">
            Sudah punya akun?
            <router-link to="/login" class="text-primary hover:text-primaryHover"
              >Login disini</router-link
            >
          </p>
          <form @submit.prevent="register" class="w-full">
            <div v-if="errorMessage" class="mb-4 text-red-500">
              {{ errorMessage }}
            </div>
            <div class="mb-4">
              <label for="nama" class="block text-sm font-medium text-gray-700"
                >Nama</label
              >
              <input
                type="text"
                v-model="nama"
                id="nama"
                class="mt-1 block w-full border border-gray-300 rounded-xl shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary sm:text-sm"
                required
              />
            </div>
            <div class="mb-4">
              <label
                for="alamat"
                class="block text-sm font-medium text-gray-700"
                >Alamat</label
              >
              <input
                type="text"
                v-model="alamat"
                id="alamat"
                class="mt-1 block w-full border border-gray-300 rounded-xl shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary sm:text-sm"
                required
              />
            </div>
            <div class="mb-4">
              <label
                for="no_telepon"
                class="block text-sm font-medium text-gray-700"
                >No Telepon</label
              >
              <input
                type="text"
                v-model="no_telepon"
                id="no_telepon"
                class="mt-1 block w-full border border-gray-300 rounded-xl shadow-sm py-2 px-3 focus:outline-none focus:ring-primary focus:border-primary sm:text-sm"
                required
              />
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
              class="w-full bg-secondary text-white py-2 px-4 rounded-xl hover:bg-secondaryHover"
            >
              Daftar
            </button>
          </form>
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
      nama: "",
      alamat: "",
      no_telepon: "",
      email: "",
      password: "",
      errorMessage: "",
    };
  },
  methods: {
    register() {
      axios
        .post("http://localhost:3000/api/register", {
          nama: this.nama,
          alamat: this.alamat,
          no_telepon: this.no_telepon,
          email: this.email,
          password: this.password,
        })
        .then((response) => {
          console.log(response.data);
          alert("User registered successfully");
          this.$router.push("/login"); // Redirect to login page after successful registration
        })
        .catch((error) => {
          console.error("Error registering user:", error.response.data);
          this.errorMessage = error.response.data;
        });
    },
  },
};
</script>

<style scoped>
/* Tambahan style jika diperlukan */
</style>
