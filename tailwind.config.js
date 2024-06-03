/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#2980b9",
        primaryHover: "#1c638e",
        admin: "#ad9200",
        adminHover: "#8a7300",
        secondary: "#F875AA",
        secondaryHover: "#d7386e",
        back: "#ecf0f1",
        text: "#36454f",
      },
      borderRadius: {
        semifull: "80px",
        semifulladmin: "40px",
        none: "0",
        sm: "0.125rem",
        DEFAULT: "4px",
        md: "0.375rem",
        lg: "0.5rem",
        xl: "0.75rem",
        full: "9999px",
        large: "12px",
      },
    },
  },
  plugins: [],
};
