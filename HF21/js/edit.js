$("#close ,.overlay").on('click', function(){
  $(".contact ,.overlay").addClass("hidden");
})

$(".btn").on('click', function(){
  $(".contact ,.overlay").removeClass("hidden");
})