<template>
  <div class="container mx-auto p-4 sm:p-6 lg:p-8">
    <div class="grid grid-cols-2 gap-6">
      <div v-for="item in products" :key="item.id" class="product-item bg-white shadow-md rounded-lg overflow-hidden transition-transform transform hover:scale-105">
        <img :src="item.image" alt="gambar produk" class="w-full h-48 object-cover"/>
        <div class="p-4">
          <h2 class="text-xl font-semibold mb-2">{{ item.name }}</h2>
          <p class="text-lg text-gray-700">Rp {{ item.price.toLocaleString() }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      products: []
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      axios.get('http://localhost:3000/api/products')
        .then(response => {
          console.log('Data fetched:', response.data);
          this.products = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    }
  }
};
</script>

<style scoped>
/* Additional styles if needed */
</style>
