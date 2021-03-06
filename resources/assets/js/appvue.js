

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

require('./bootstrap');

window.Vue = require('vue');
Vue.component('comment_post', require('./components/comments/Comment_Post.vue').default);
Vue.component('comment_root', require('./components/comments/Comment_root.vue').default);
Vue.component('comment_child', require('./components/comments/Comment_child.vue').default);
const app = new Vue({
    el: '#app'
});

