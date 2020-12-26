import Vue from 'vue';

import AppHeader from './components/AppHeader/';
import ComicsList from './components/ComicsList/';

!function () {
  window.addEventListener('DOMContentLoaded', (ev) => {
    const comicsWrapper = document.querySelector('#content');

    if (!comicsWrapper) return;

    const listTitle = comicsWrapper.dataset.comicsTitle;

    new Vue({
      el: '#content',
      render: h => h('main', {}, [
        h(AppHeader, {}),
        h(ComicsList, { props: { title: listTitle } })
      ])
    });
  });
}();
