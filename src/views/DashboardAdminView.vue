<template>
  <div>
    <div class="bg-admin flex py-2 px-6 text-white font-bold justify-between">
      <img src="@/assets/icon/Logo Petshop Emas.svg" alt="PetCare Shop Logo" class="w-16 h-16" />
      <p class="my-auto text-4xl">PetCare Shop<span class="text-xs">Admin</span></p>
    </div>
    <div class="container mx-auto p-4">
      <div class="border p-4 rounded-md">
        <h2 class="text-xl mb-4">Data Barang</h2>
        <div class="mb-4">
          <select v-model="newProduct.category" class="form-select mt-1 block w-full">
            <option value="" disabled>Pilih Kategori</option>
            <option value="makanan">Makanan</option>
            <option value="aksesoris">Aksesoris</option>
            <option value="obat">Obat</option>
          </select>
        </div>
        <div class="mb-4">
          <input v-model="newProduct.name" type="text" placeholder="Nama" class="form-input mt-1 block w-full border" />
        </div>
        <div class="mb-4">
          <input v-model="newProduct.price" type="number" placeholder="Harga" class="form-input mt-1 block w-full border" />
        </div>
        <div class="mb-4">
          <input v-model="newProduct.image" type="text" placeholder="Masukan Gambar Produk" class="form-input mt-1 block w-full border" />
        </div>
        <button @click="addProduct" class="bg-adminHover text-white py-2 px-4 rounded-md">Tambah Produk</button>
      </div>
      <router-link to="/" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-md">Kembali</router-link>
      <div class="mt-8">
        <h2 class="text-xl mb-4">List Produk</h2>
        <div v-for="(products, category) in groupedProducts" :key="category" class="mb-6">
          <h3 class="text-lg mb-2">{{ category }}</h3>
          <table class="min-w-full bg-white border">
            <thead>
              <tr>
                <th class="py-2 px-4 border-b">Nama</th>
                <th class="py-2 px-4 border-b">Harga</th>
                <th class="py-2 px-4 border-b">Aksi</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="product in products" :key="product.id">
                <td class="py-2 px-4 border-b">{{ product.name }}</td>
                <td class="py-2 px-4 border-b">{{ product.price }}</td>
                <td class="py-2 px-4 border-b">
                  <button @click="editProduct(product)" class="bg-blue-500 text-white py-1 px-2 rounded-md mr-2">Edit</button>
                  <button @click="deleteProduct(product)" class="bg-red-500 text-white py-1 px-2 rounded-md">Hapus</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div v-if="editingProduct">
          <h3 class="text-lg mb-2">Edit Produk</h3>
          <div class="border p-4 rounded-md mb-4">
            <div class="mb-4">
              <input v-model="editingProduct.name" type="text" placeholder="Nama" class="form-input mt-1 block w-full border" />
            </div>
            <div class="mb-4">
              <input v-model="editingProduct.price" type="number" placeholder="Harga" class="form-input mt-1 block w-full border" />
            </div>
            <div class="mb-4">
              <input v-model="editingProduct.image" type="text" placeholder="Masukan Gambar Produk" class="form-input mt-1 block w-full border" />
            </div>
            <button @click="updateProduct" class="bg-blue-500 text-white py-2 px-4 rounded-md">Simpan Perubahan</button>
            <button @click="cancelEdit" class="bg-gray-300 text-gray-700 py-2 px-4 rounded-md ml-2">Batal</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      products: [],
      newProduct: {
        category: '',
        name: '',
        price: '',
        image: ''
      },
      editingProduct: null
    };
  },
  mounted() {
    this.fetchProducts();
  },
  methods: {
    async fetchProducts() {
      try {
        const response = await fetch('http://localhost:3000/api/products');
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        this.products = data;
      } catch (error) {
        console.error('Error fetching products:', error);
      }
    },
    async addProduct() {
      if (this.isDuplicateProduct(this.newProduct)) {
        alert('Produk dengan data yang sama sudah ada!');
        return;
      }

      try {
        const response = await fetch('http://localhost:3000/api/products', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.newProduct)
        });

        if (response.ok) {
          alert('Produk berhasil ditambahkan!');
          this.fetchProducts(); // Refresh the list after adding a product
        } else {
          alert('Gagal menambahkan produk!');
        }
      } catch (error) {
        console.error('Error adding product:', error);
        alert('Terjadi kesalahan saat menambahkan produk!');
      }
    },
    async deleteProduct(product) {
      try {
        const response = await fetch(`http://localhost:3000/api/products/${product.id}`, {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ category: product.category })
        });

        if (response.ok) {
          alert('Produk berhasil dihapus!');
          this.fetchProducts(); // Refresh the list after deleting a product
        } else {
          alert('Gagal menghapus produk!');
        }
      } catch (error) {
        console.error('Error deleting product:', error);
        alert('Terjadi kesalahan saat menghapus produk!');
      }
    },
    async editProduct(product) {
      // Copy product to editingProduct for editing form display
      this.editingProduct = { ...product };
    },
    async updateProduct() {
      const { id, ...updatedProduct } = this.editingProduct;
      try {
        const response = await fetch(`http://localhost:3000/api/products/${id}`, {
          method: 'PUT', // Change as needed, e.g., 'PATCH' if updating partial data
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(updatedProduct)
        });

        if (response.ok) {
          alert('Produk berhasil diperbarui!');
          this.fetchProducts(); // Refresh list after successful update
          this.editingProduct = null; // Reset editing form after successful update
        } else {
          alert('Gagal memperbarui produk!');
        }
      } catch (error) {
        console.error('Error updating product:', error);
        alert('Terjadi kesalahan saat memperbarui produk!');
      }
    },
    cancelEdit() {
      // Cancel edit mode and reset editingProduct
      this.editingProduct = null;
    },
    isDuplicateProduct(newProduct) {
      return this.products.some(product =>
        product.category === newProduct.category &&
        product.name === newProduct.name &&
        product.price === newProduct.price &&
        product.image === newProduct.image
      );
    }
  },
  computed: {
    groupedProducts() {
      return this.products.reduce((groups, product) => {
        if (!groups[product.category]) {
          groups[product.category] = [];
        }
        groups[product.category].push(product);
        return groups;
      }, {});
    }
  }
};
</script>

<style scoped>
</style>
