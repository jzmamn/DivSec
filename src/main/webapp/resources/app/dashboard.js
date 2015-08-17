$.ajax({
	type : "GET",
	url : "dashboard",

	success : function(response) {
		$('#page-content').html(response);
	},
	error : function(e) {
		alert('Error: ' + e);
	}
});
