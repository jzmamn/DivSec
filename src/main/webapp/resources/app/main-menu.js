$("#button-page").click(function() {
	$.ajax({
		type : "GET",
		url : "button",

		success : function(response) {
			$('#page-content').html(response);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});

});
