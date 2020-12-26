<template lang="pug">
main
  app-header
  comics-list(:title='listTitle')
</template>

<script>
import AppHeader from '../AppHeader/';
import ComicsList from '../ComicsList/';

const props = {
  listTitle: {
    type: String,
    required: true
  }
};

const data = function () {
  return {};
};

const computed = {
};

const methods = {
};

export default {
  name: 'app',
  components: {
    AppHeader,
    ComicsList
  },
  props,
  data,
  computed,
  methods
}
</script>
