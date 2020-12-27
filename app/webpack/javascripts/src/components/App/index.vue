<template lang="pug">
main
  app-header
  comics-list(
    :title='listTitle'
    :comics-url='comicsUrl'
    @change-page='currentComicsUrl = $event'
  )
</template>

<script>
import AppHeader from '../AppHeader/';
import ComicsList from '../ComicsList/';

const props = {
  defaultComicsUrl: {
    type: String,
    required: true
  },
  listTitle: {
    type: String,
    required: true
  }
};

const data = function () {
  return {
    currentComicsUrl: ''
  };
};

const computed = {
  comicsUrl () {
    return this.currentComicsUrl || this.defaultComicsUrl
  }
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
