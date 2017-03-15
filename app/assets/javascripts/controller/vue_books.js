var bookTable = new Vue({
  el: '#book-table',
  data: {
    books: [],
    book: {
      isbn: '',
      title: '',
      name: '',
      author: '',
      release_date: ''
    }
    
  },
  mounted: function () {
    var that = this
    var url = '/vue_books'
    this.$http.get(url).then(response => {
      that.books = response.body.books
    }, response => {

    })
  },
  methods: {
    onCreateClick: function (event) {
      this.books.unshift(this.book)
    },
    onEditClick: function (book) {
      // book.is_edit = true
      // console.log(book)
    },
    onDeleteClick: function (book) {
      var index = this.books.indexOf(book)
      this.books.splice(index, 1)
    }
  }
})