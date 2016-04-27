$( document ).ready(function() {
   $('.sign-in-btn').on('click', function(event) {
    event.preventDefault();
    var $link = $(this);

    // console.log("login link" + $link.attr("href"));
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      // type: 'get'
    });

    ajaxRequest.done(function (formHtml) {
      // console.log(formHtml);
      $(".form-holder").animate({
      height: '50px'}, "fast"
    );
      $('.form-holder').html(formHtml);
    });
  }); // end login click handler

// -------- sign up click btn handler ajax ------------------
  $('.register-btn').on('click', function(event) {
    event.preventDefault();
    var $link = $(this);
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
      // type: 'get'
    });

    ajaxRequest.done(function (formHtml) {
      // console.log(formHtml);
      $(".form-holder").animate({
      height: '200px'}, "fast"
    );
      $('.form-holder').html(formHtml)
    });
  }); // end signup click handler
});
