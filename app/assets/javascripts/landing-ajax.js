$( document ).ready(function() {
   $('.sign-in-bttn').on('click', function(event) {
    event.preventDefault();
    var $link = $(this);
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
    });

    ajaxRequest.done(function (formHtml) {
      if ($('.form-holder').html().length === 0){
        $(".form-holder").animate({
          height: '200px'}, "fast"
        );
        $('.form-holder').html(formHtml);
      }else{
        $('.form-holder').empty();
      }
    });
  }); // end login click handler

// -------- sign up click btn handler ajax ------------------
  $('.register-bttn').on('click', function(event) {
    event.preventDefault();

    var $link = $(this);
    var ajaxRequest = $.ajax({
      url: $link.attr("href"),
    });

    ajaxRequest.done(function (formHtml) {
      if ($('.form-holder').html().length === 0){
        $(".form-holder").animate({
          height: '200px'}, "fast"
        );
        $('.form-holder').html(formHtml);
      }else{
        $('.form-holder').empty();
      }
    });
  }); // end signup click handler
});
