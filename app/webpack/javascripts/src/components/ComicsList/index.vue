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
      @change-page='$emit("change-page", $event)'
    )
</template>

<script>
import { times } from 'lodash';
import { ajax } from 'nanoajax';
import ComicCard from '../ComicCard/';
import ComicsPagination from '../ComicsPagination/';

const props = {
  character: String,
  comicsUrl: {
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

const watch = {
  character: function (newValue) {
  },
  comicsUrl: function (newValue) {
    this.loadComics();
  }
};

const mounted = function () {
  this.loadComics();
};

const updateComics = function (vue, { data: comics, links: paginationData }) {
  const comicsData = comics.map(({ id, attributes: { title, image } }) => (
    { id, title, image: image || '' }
  ));

  updateState(vue, {
    comics: comicsData,
    loading: false,
    paginationLinks: paginationData
  });
};

const updateState = function (vue, state) {
  Object.assign(vue.$data, state);
};

const methods = {
  loadComics () {
    const $self = this;
    const headers = { 'Accept': 'application/json' };

    updateState(this, { comics: [], loading: true });

    ajax({url: this.comicsUrl}, function (code, rawData) {
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
  watch,
  mounted,
  methods
}
</script>
