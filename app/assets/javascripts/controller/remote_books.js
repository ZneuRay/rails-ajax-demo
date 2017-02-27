$(document).on('turbolinks:load', function () {
  // load table by ajax on ready
  refreshTable()

  // set up when create/edit button is click
  $('#formModal').on('show.bs.modal', function (event) {
    // hide alert message
    $('.modal-danger-message').hide()
    $('.modal-success-message').hide()
    var button = $(event.relatedTarget)
    var title = button.data('title')
    var modal = $(this)
    // change title for modal
    modal.find('.modal-title').text(title)
  });
})

function refreshTable()
{
  var table = $("#tableContent")
  var tableUrl = table.data('url')
  $.get(tableUrl, function (data) {
    table.html(data)
  })
}