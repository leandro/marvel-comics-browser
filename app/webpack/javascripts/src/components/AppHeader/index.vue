<template lang="pug">
header
  .logo(title='Marvel logo')
  h1.title comics catalog
  .search-box
    .input-group
      input(type="text" placeholder="search by character")
      button(title="search") Search
</template>

<script>
const props = {
};

const data = function () {
  return {};
};

const computed = {
};

const methods = {
};

export default {
  name: 'app-header',
  props,
  data,
  computed,
  methods
}
</script>
