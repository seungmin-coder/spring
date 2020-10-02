

	
	
	
$(function (){
	  $(".Updatefirst").click(function () {
		  $(".RR_box_content").attr("readonly", false);
		  $(".RR_box_update").show();
		  $(".RR_box_content").focus();
		   $(".RR_box_content").blur();
	  });
	})
