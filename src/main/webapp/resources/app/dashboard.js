$.ajax({
	type : "GET",
	url : "main-menu/dashboard",

	success : function(response) {
		$('#page-content').html(response);
	},
	error : function(e) {
		alert('Error: ' + e);
	}
});
