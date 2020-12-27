<template lang="pug">
.pagination
  .pagination__nav(
    :class='{ "pagination__nav--disabled": !prevUrl }'
    @click='goToPage(prevUrl)'
  ) Previous page
  .pagination__nav(
    :class='{ "pagination__nav--disabled": !nextUrl }'
    @click='goToPage(nextUrl)'
  ) Next page
</template>

<script>
const props = {
  nextUrl: String,
  prevUrl: String
};

const data = function () {
  return {};
};

const computed = {
};

const methods = {
  goToPage (url) {
    if (!url) return;

    this.$emit('change-page', url);
  }
};

export default {
  name: 'comics-pagination',
  props,
  data,
  computed,
  methods
}
</script>
