import Vue from 'vue';

import App from './components/App/';

!function () {
  window.addEventListener('DOMContentLoaded', (ev) => {
    const comicsWrapper = document.querySelector('#content');

    if (!comicsWrapper) return;

    const {
      defaultComicsUrl,
      comicsTitle: listTitle
    } = Object.assign({}, comicsWrapper.dataset);

    new Vue({
      el: '#content',
      render: h => h(App, { props: { defaultComicsUrl, listTitle } })
    });
  });
}();
