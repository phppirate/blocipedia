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

$(".toggle-view").click(function(e){
  
    $($(".toggle-view").attr("data-toggle")).toggleClass("hide");

});

$("input[data-role='filter']").keyup(function(e){
    var item = $(this).val();
    $(this).css("border","1px dashed red");
    $($(this).attr("data-target") + ' li').css("display","none");
    $($(this).attr("data-target") + ' li:contains(' + item + ')').css("display","block");
});