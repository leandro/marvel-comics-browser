<template lang="pug">
li.comics__item(v-if='imageUrl')
  span.comics__heart
  img(
    :src='imageUrl'
    :title='imageTitle'
  )
  span.comics__description {{description}}
li.comics__item.comics__item--missing-cover(v-else)
  span.comics__heart
  span.comics__alert cover missing
  span.comics__description {{description}}
</template>

<script>

const props = {
  bookmarked: {
    type: Boolean,
    default: false
  },
  description: {
    type: String,
    required: true
  },
  imageTitle: String,
  imageUrl: {
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
  name: 'comic-card',
  props,
  data,
  computed,
  methods
}
</script>
