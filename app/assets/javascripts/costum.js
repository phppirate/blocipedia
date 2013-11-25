$(document).ready(function(e){

  var text = $(".markdown-preview").val();

  var converter = new Showdown.converter();
  var html = converter.makeHtml(text);

  //alert(html);

  $($(".markdown-preview").attr("data-target")).html(html);

});

$(".markdown-preview").keyup(function(e){
  
   var text = $(this).val();

   var converter = new Showdown.converter();
   var html = converter.makeHtml(text);

   //alert(html);
  
  $($(this).attr("data-target")).html(html);
});