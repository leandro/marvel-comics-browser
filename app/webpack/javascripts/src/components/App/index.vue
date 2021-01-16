<template lang="pug">
main
  app-header(@search='searchCharacter')
  comics-list(
    :title='listTitle'
    :comics-url='comicsUrl'
    :character='character'
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
    character: '',
    currentComicsUrl: ''
  };
};

const computed = {
  comicsUrl () {
    return (
      this.currentComicsUrl ||
        `${this.defaultComicsUrl}?query=${this.character}`
    );
  }
};

const methods = {
  searchCharacter (character) {
    Object.assign(this.$data, { currentComicsUrl: '', character: character });
  }
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
