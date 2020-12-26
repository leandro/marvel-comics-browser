<template lang="pug">
section.comics-listing
  h2.title {{title}}
  .loading-box(v-if='loading')
    .loading-box__animation
    .loading-box__label loading
  ul.comics(v-else)
    comic-card(
      v-for='comic in comics'
      :key='comic.id'
      :image-url='comic.image'
      :description='comic.title'
    )
</template>

<script>
import { times } from 'lodash';
import { ajax } from 'nanoajax';
import ComicCard from '../ComicCard/';

const props = {
  comicsPath: {
    type: String,
    required: true
  },
  title: {
    type: String,
    required: true
  }
};

const data = function () {
  return {
    loading: true,
    comics: []
  };
};

const computed = {
};

const mounted = function () {
  this.loadComics();
};

const updateComics = function (vue, { data: comics, links: paginationData }) {
  const comicsData = comics.map(({ id, attributes: { title, image } }) => (
    { id, title, image: image || '' }
  ));

  Object.assign(vue.$data, { comics: comicsData, loading: false });
};

const methods = {
  loadComics () {
    const $self = this;
    const headers = { 'Accept': 'application/json' };

    ajax({url: this.comicsPath}, function (code, rawData) {
      const payload = JSON.parse(rawData);

      if (payload.data) {
        updateComics($self, payload);
      } else {
        displayError($self, payload);
      }
    });
  }
};

export default {
  name: 'comics-list',
  components: {
    ComicCard
  },
  props,
  data,
  computed,
  mounted,
  methods
}
</script>
