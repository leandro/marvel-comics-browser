<template lang="pug">
li.comics__item(:class='{ "comics__item--missing-cover": !imageUrl }')
  span.comics__heart
  img(
    v-if='imageUrl'
    :src='imageUrl'
    :title='imageTitle'
  )
  span.comics__alert(v-else) cover missing
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
