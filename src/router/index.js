import { createRouter, createWebHashHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import Login from "../views/LoginView.vue";
import Register from "../views/RegisterView.vue";
import Dashboard from "../views/DashboardView.vue";
import LoginAdmin from "../views/LoginAdminView.vue";
import DashboardAdmin from "../views/DashboardAdminView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/login",
    name: "login",
    component: Login,
  },
  {
    path: "/register",
    name: "register",
    component: Register,
  },
  {
    path: "/dashboard",
    name: "dashboard",
    component: Dashboard,
  },
  {
    path: "/loginadmin",
    name: "loginadmin",
    component: LoginAdmin,
  },
  {
    path: "/dashboardadmin",
    name: "dashboardadmin",
    component: DashboardAdmin,
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
