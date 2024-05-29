<template>
    <header class="bg-primary py-4 px-6 flex items-center justify-between">
      <!-- Logo -->
      <img src="@/assets/logo.svg" alt="PetCare Shop Logo" class="w-16 h-16" />
  
      <!-- Fitur Pencarian -->
      <div class="relative ml-4 flex-1">
        <div class="flex items-center">
          <input
            type="text"
            placeholder="Cari produk..."
            class="w-full py-1 px-3 border border-gray-300 rounded-full focus:outline-none focus:ring-primary focus:border-primary"
            v-model="searchQuery"
            @input="handleInput"
          />
          <button
            v-if="searchQuery"
            @click="clearSearch"
            class="absolute inset-y-0 right-8 bg-primary text-white py-1 px-2 rounded-full hover:bg-primaryHover"
          >
            <svg
              class="w-4 h-4"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M6 18L18 6M6 6l12 12"
              ></path>
            </svg>
          </button>
          <button
            @click="search"
            class="absolute inset-y-0 right-0 bg-primary text-white py-1 px-4 rounded-full hover:bg-primaryHover"
          >
            <svg
              class="w-4 h-4"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M21 21l-4.35-4.35M16.65 10.5a5.15 5.15 0 1 1-10.3 0 5.15 5.15 0 0 1 10.3 0z"
              ></path>
            </svg>
          </button>
        </div>
      </div>
  
      <!-- Logo Keranjang -->
      <img src="" alt="p" class="w-12 h-12 ml-4" />
    </header>
  </template>
  
  <script>
  export default {
    data() {
      return {
        searchQuery: '',
      };
    },
    methods: {
      handleInput() {
        // Handle input event
      },
      clearSearch() {
        this.searchQuery = '';
      },
      search() {
        // Implement search functionality
      },
    },
  };
  </script>
  
  <style scoped>
  /* Styling untuk komponen header */
  /* Ganti ukuran dan gaya sesuai preferensi Anda */
  img {
    width: 3rem;
    height: 3rem;
  }
  </style>
  