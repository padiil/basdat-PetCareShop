<template lang="">
  <div>
    <HeaderDashboard class="fixed right-0 left-0 z-20" />
    <div class=" py-24">
      <ProductList />
    </div>
    <NavbarSection class="fixed bottom-0 right-0 left-0" />
  </div>
</template>
<script setup>
import HeaderDashboard from "@/components/HeaderDashboard.vue";
import NavbarSection from "@/components/NavbarSection.vue";
import ProductList from "@/components/ProductList.vue";
</script>
<style lang=""></style>
