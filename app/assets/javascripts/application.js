// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require kindeditor
//= require markitup
//= require markitup/sets/xbbcode/set

$(document).ready(function(){
	function getvalue() { 
		var a = document.getElementById('file_uploader').value; 
		var reg = /[^\\\/]*[\\\/]+/g;
		var b = a.replace(reg, "")
	 	return b; 
	}

	$('#file_uploader').on('change', function(){
		$('#file_name').val(getvalue())
	})
    
	$(".markdown").markItUp(myMarkdownSettings)
	

	$(".blog_like_ctrl").on("click", function(){
		if ($(".blog_like").attr("class").match(/blog_like_link/)){
			$.ajax({
				type: "POST",
				data:{blog: gon.blog_id},
				dataType: "json",
				url:"/faverates",
				success:function(){
					$(".blog_like").addClass("blog_dislike_link").removeClass("blog_like_link")
					$(".like_count").text(parseInt($(".like_count").text())+1)
				}
			})
		}
		else if ($(".blog_like").attr("class").match(/blog_dislike_link/)){
			$.ajax({
				type: "DELETE",
				data:{blog: gon.blog_id},
				dataType: "json",
				url:"/faverates/delete",
				success:function(){
					$(".blog_like").addClass("blog_like_link").removeClass("blog_dislike_link")
					$(".like_count").text(parseInt($(".like_count").text())-1)
				}
			})
		}
  })

  $(".addmore").click(function(){
		$('<input class="create_author" type="text" name="users[]"/>').appendTo($('.section_user'));
	})
	

	$(".plusmore").click(function(){
		$('.section_user :last-child').remove();
	})

})
