/*TABの写真・文字の切り替えのJS*/
$(".tab-content>div").hide();
$(".tab-content>div").first().slideDown(0);
$(".tab-buttons span").click(function () {
   var thisclass = $(this).attr("class");
   $("#lamp").removeClass().addClass("#lamp").addClass(thisclass);
   $(".tab-content>div").each(function () {
      if ($(this).hasClass(thisclass)) {
         $(this).fadeIn(0);
      } else {
         $(this).hide();
      }
   });
});
