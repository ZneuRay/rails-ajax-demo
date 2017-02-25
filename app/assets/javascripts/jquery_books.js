$(document).ready(function () {
  // load table by ajax on ready
  refreshTable()

  // load form by ajax when create/update button is click
  $('#formModal').on('show.bs.modal', function (event) {
    // hide alert message
    $('.modal-danger-message').hide()
    $('.modal-success-message').hide()
    var button = $(event.relatedTarget)
    var title = button.data('title')
    var submitText = button.data('submit')
    var url = button.data('url')
    var modal = $(this)
    // change title and the text of button
    modal.find('.modal-title').text(title)
    modal.find('#submitFormBtn').text(submitText)
    // get form by ajax
    $.get(url, function (data) {
      modal.find('.modal-ajax-content').html(data)
    })
  });

  // submit form which shown in modal  
  $('#submitFormBtn').on('click', function () {
    var form = $('.simple_form')
    var actionUrl = form.attr('action')
    $.post(actionUrl, form.serialize(), function (data) {
      if (data.status == 0) {
        $('.modal-danger-message').hide('fast')
        $('.modal-success-message').html(data.message).show('fast')
        $('#formModal').modal('hide')
        refreshTable()
      } else {
        $('.modal-success-message').hide('fast')
        $('.modal-danger-message').show('fast').html(data.message)
      }
    })
  })

  // on delete button click  
  $(document).on('click', '.delete-book-btn', function (event) {
    var deleteBtn = $(this)
    if (confirm('Are you sure?')) {
      // using ajax to delete book
      $.ajax({
        url: deleteBtn.data('url'),
        type: 'delete'
      }).done(function () {
        refreshTable()
      })
    }
  })
})

function refreshTable()
{
  var table = $("#tableContent")
  var tableUrl = table.data('url')
  $.get(tableUrl, function (data) {
    table.html(data)
  })
}