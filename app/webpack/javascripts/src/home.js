import Vue from 'vue';

import ComicsList from './components/ComicsList/';

!function () {
  window.addEventListener('DOMContentLoaded', (ev) => {
    const comicsWrapper = document.querySelector('#content');

    if (!comicsWrapper) return;

    const listTitle = comicsWrapper.dataset.comicsTitle;

    new Vue({
      el: '#content',
      render: h => h(ComicsList, {
        props: { title: listTitle }
      })
    });
  });
}();
