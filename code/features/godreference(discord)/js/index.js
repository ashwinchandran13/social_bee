// Referenced for search bar: https://alligator.io/vuejs/vue-autocomplete-component/

Vue.component("search", {
  template: `
    <div class="settings__search">
      <input class="search__input" type="text" v-model="search" @input="onChange" @focus="isOpen = !isOpen" @blur="isOpen = !isOpen"/>
      <div class="search__dropdown" v-show="isOpen">
          <div class="dropdown__friend" v-for="(result, i) in results" :key="i" @click="setResult(result)">
              <div class="friend__avatar">
                  <div class="avatar__status"></div>
              </div>
              <div class="friend__user">
                  <div class="user__name">{{ result }}</div>
              </div>
          </div>
      </div>
  </div>
  `,
  name: "search",
  props: {
    users: {
      type: Array,
      required: false,
      default: () => [] } },


  data() {
    return {
      search: "",
      results: [],
      isOpen: false };

  },
  methods: {
    onChange() {
      this.isOpen = true;
      this.filterResults();
    },
    filterResults() {
      this.results = this.users.filter(
      user => user.toLowerCase().indexOf(this.search.toLowerCase()) > -1);

    },
    setResult(result) {
      this.search = result;
      this.isOpen = false;
    } } });



new Vue({
  el: ".grid",
  data() {
    return {
      active: false,
      post: "",
      posts: ["Write a message below and hit enter"] };

  },
  updated() {
    this.$nextTick(() => {
      let chat = this.$refs.chat;
      chat.scrollTop = chat.scrollHeight;
    });
  },
  methods: {
    createPost() {
      let post = this.post && this.post.trim();
      if (!post) {
        return;
      }
      this.posts.push(post);
      this.post = "";
    } } });