<template lang="pug">
section.comics-listing
  h2.title {{title}}
  ul.comics
    comic-card(
      v-for='comic in comics'
      :key='comic.id'
      :image-url='comic.url'
      :description='comic.description'
    )
</template>

<script>
import { times } from 'lodash';
import ComicCard from '../ComicCard/';

const props = {
  title: {
    type: String,
    required: true
  }
};

const data = function () {
  return {};
};

const computed = {
  comics () {
    return (
      times(10, (i) => (
        {
          id: i,
          url: 'http://i.annihil.us/u/prod/marvel/i/mg/f/50/5fdb794a3be0d/portrait_fantastic.jpg',
          description: 'This is just a test, right?'
        }
      ))
    );
  }
};

const methods = {
};

export default {
  name: 'comics-list',
  components: {
    ComicCard
  },
  props,
  data,
  computed,
  methods
}
</script>
