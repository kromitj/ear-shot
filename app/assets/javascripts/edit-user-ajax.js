$( document ).ready(function() {
  $('.edit-user-btn').on('click', function(event) {
    event.preventDefault();

    var $link = $(this);
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      type: 'get'
    });

    ajaxRequest.done(function (formHtml) {
      console.log(formHtml);
      $('.edit-wrapper').html(formHtml)
    });
  })
});
