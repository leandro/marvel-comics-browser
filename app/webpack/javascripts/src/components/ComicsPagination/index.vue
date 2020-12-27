<template lang="pug">
.pagination
  .pagination__nav(
    :class='{ "pagination__nav--disabled": !prevUrl }'
  ) Previous page
  .pagination__nav(
    :class='{ "pagination__nav--disabled": !nextUrl }'
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
};

export default {
  name: 'comics-pagination',
  props,
  data,
  computed,
  methods
}
</script>
