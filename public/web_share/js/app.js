$(document).ready(function(){
  // $.ajax({
  //   url: "http://phpshare.csdn.net/api/csdnshare/list/pageno/1/pagesize/18/format/jsonp",
  //   type: "get",
  //   async: true,
  //   dataType: "jsonp",
  //   jsonp: "callback",
  //   jsonpCallback: "jsonpCallback",
  //   success:function(result){
  //     $.each(result.data.list,function(k, v){
  //       $(".pricing-table").prepend("<li class='bullet-item'><a class='index-link'><img class='index-th' src="+v.thumb+"><span class='index-title' href='#'>"+v.title+"</span></a></li>");
  //     });
  //     $.ajax({
  //       url: "http://phpshare.csdn.net/api/csdnshare/tagrank/format/jsonp",
  //       type: "get",
  //       async: false,
  //       dataType: "jsonp",
  //       jsonp: "callback",
  //       jsonpCallback: "jsonpCallback",
  //       success:function(result){
  //         $.each(result.data,function(k, v){
  //           $(".left-off-canvas-menu .off-canvas-list").append("<li><a href='#'>"+v.name+"</a></li>");
  //         });
  //       }
  //     });
  //   }
  // });
  $.getJSON('modal/index.json', function(result){
    $.each(result.data.list,function(k, v){
      $(".pricing-table").prepend("<li class='bullet-item'><a class='index-link'><img class='index-th' src="+v.thumb+"><span class='index-title' href='#'>"+v.title+"</span></a></li>");
    });
  })

  $.getJSON('modal/tags.json', function(result){
    $.each(result.data,function(k, v){
      $(".left-off-canvas-menu .off-canvas-list").append("<li><a href='#'>"+v.name+"</a></li>");
    });
  })

})
$(document).foundation();
