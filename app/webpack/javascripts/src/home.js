import Vue from 'vue';

import App from './components/App/';

!function () {
  window.addEventListener('DOMContentLoaded', (ev) => {
    const comicsWrapper = document.querySelector('#content');

    if (!comicsWrapper) return;

    const listTitle = comicsWrapper.dataset.comicsTitle;

    new Vue({
      el: '#content',
      render: h => h(App, { props: { listTitle } })
    });
  });
}();
