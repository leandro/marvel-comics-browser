<template lang="pug">
header
  .logo(title='Marvel logo')
  h1.title comics catalog
  .search-box
    .input-group
      input(
        type='text'
        v-model.lazy='character'
        placeholder='search by character'
      )
      button(
        title='search'
        @click='search'
      ) Search
</template>

<script>
const data = function () {
  return {
    character: ''
  };
};

const methods = {
  search () {
    const query = this.character.trim();

    this.$emit('search', query);
  }
};

export default {
  name: 'app-header',
  data,
  methods
}
</script>
