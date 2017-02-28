var bookTable = new Vue({
  el: '#book-table',
  data: {
    books: []
  },
  mounted: function () {
    var that = this
    var url = $('#book-table').data('url')
    $.getJSON(url, function (data) {
      that.books = data.books
    })
  },
  methods: {
    onCreateClick: function (event) {
      console.log(event.target)
      modal.modalTitle = 'Create book'
    },
    onEditClick: function () {
      modal.modalTitle = 'Edit book'
    },
    createBook: function () {
      
    }
  }
})

var modal = new Vue({
  el: '#formModal',
  data: {
    modalTitle: 'Create book',
    modalSubmitText: 'Submit'
  }
})