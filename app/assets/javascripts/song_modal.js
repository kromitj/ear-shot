$( document ).ready(function() {
  $('.song-link').on('click', function(event) {
    event.preventDefault();
    var $link = $(this);
    console.log($link);
    // console.log("login link" + $link.attr("href"));
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      // type: 'get'
    });

    ajaxRequest.done(function (modal) {
      // console.log(formHtml);

      $(".test").empty();
      $(".test").append(modal);
      $('.modal').modal('show');
    });
   })
});
