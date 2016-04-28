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

// -------- login click btn handler ajax ------------------
 $("#home-jumbo").on("click", ".form-group input[type=submit]", function(event){
    event.preventDefault();
    var data = $(".form-control").serialize();
    var ajaxRequest = $.ajax({
      type: "POST",
      url: '/session',
      data: data
    });
    ajaxRequest.success(function(response){
      window.location = "users/"+response.user_id
    })
    ajaxRequest.fail(function(response){
      var data = JSON.parse(response.responseText);
      $("#errors").text(data.error);
    });

  });
// ===========================register error handler===================
 $("#home-jumbo").on("click", ".input-group input[type=submit]", function(event){
    event.preventDefault();
    var data = $(".form-control").serialize();
    var ajaxRequest = $.ajax({
      type: "POST",
      url: '/users',
      data: data,
    });

   ajaxRequest.success(function(response){
        window.location = "users/"+response.user_id
    })
    ajaxRequest.fail(function(response){
     var data = JSON.parse(response.responseText);
         $("#errors").text(data.error);
    });

  })


});
