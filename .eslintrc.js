module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
  },
  ignorePatterns: ["public", "package-lock.json", "*.gif", "*.svg", "*.css"],
  extends: [
    'eslint:recommended',
    'plugin:vue/vue3-recommended',
    'plugin:import/recommended'
  ],
  rules: {
  },
  globals: {
    _: true,
  },
}
