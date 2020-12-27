<template lang="pug">
section.comics-listing
  h2.title {{title}}
  .loading-box(v-if='loading')
    .loading-box__animation
    .loading-box__label loading
  div(v-else)
    ul.comics
      comic-card(
        v-for='comic in comics'
        :key='comic.id'
        :image-url='comic.image'
        :description='comic.title'
      )
    comics-pagination(
      :next-url='nextUrl'
      :prev-url='prevUrl'
    )
</template>

<script>
import { times } from 'lodash';
import { ajax } from 'nanoajax';
import ComicCard from '../ComicCard/';
import ComicsPagination from '../ComicsPagination/';

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
    comics: [],
    loading: true,
    paginationLinks: {}
  };
};

const computed = {
  nextUrl () {
    return this.paginationLinks.next;
  },
  prevUrl () {
    return this.paginationLinks.prev;
  }
};

const mounted = function () {
  this.loadComics();
};

const updateComics = function (vue, { data: comics, links: paginationData }) {
  const comicsData = comics.map(({ id, attributes: { title, image } }) => (
    { id, title, image: image || '' }
  ));

  Object.assign(vue.$data, {
    comics: comicsData,
    loading: false,
    paginationLinks: paginationData
  });
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
    ComicCard,
    ComicsPagination
  },
  props,
  data,
  computed,
  mounted,
  methods
}
</script>
