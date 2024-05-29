<template>
    <div class="product-list">
      <h1>Aksesoris</h1>
      <div v-for="item in aksesoris" :key="item.id_aksesoris" class="product-item">
        <img :src="item.gambar_aksesoris" alt="gambar aksesoris" />
        <h2>{{ item.nama_aksesoris }}</h2>
        <p>Rp {{ item.harga_aksesoris.toLocaleString() }}</p>
      </div>
      
      <h1>Makanan</h1>
      <div v-for="item in makanan" :key="item.id_makanan" class="product-item">
        <img :src="item.gambar_makanan" alt="gambar makanan" />
        <h2>{{ item.nama_makanan }}</h2>
        <p>Rp {{ item.harga_makanan.toLocaleString() }}</p>
      </div>
      
      <h1>Obat</h1>
      <div v-for="item in obat" :key="item.id_obat" class="product-item">
        <img :src="item.gambar_obat" alt="gambar obat" />
        <h2>{{ item.nama_obat }}</h2>
        <p>Rp {{ item.harga_obat.toLocaleString() }}</p>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        aksesoris: [],
        makanan: [],
        obat: []
      };
    },
    created() {
      this.fetchData();
    },
    methods: {
      fetchData() {
        axios.get('http://localhost:3000/api/aksesoris')
          .then(response => {
            this.aksesoris = response.data;
          })
          .catch(error => {
            console.error(error);
          });
  
        axios.get('http://localhost:3000/api/makanan')
          .then(response => {
            this.makanan = response.data;
          })
          .catch(error => {
            console.error(error);
          });
  
        axios.get('http://localhost:3000/api/obat')
          .then(response => {
            this.obat = response.data;
          })
          .catch(error => {
            console.error(error);
          });
      }
    }
  };
  </script>
  
  <style scoped>
  .product-list {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .product-item {
    border: 1px solid #ddd;
    padding: 16px;
    margin: 16px;
    text-align: center;
  }
  .product-item img {
    max-width: 100%;
    height: auto;
  }
  </style>
  