$("#mnuDashboard").click(function() {
	event.preventDefault();
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

});

$("#mnuNewRequest").click(function() {
	event.preventDefault();
	$.ajax({
		type : "GET",
		url : "main-menu/button",
		async:false,

		success : function(response) {
			$('#page-content').html(response);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
});

$("#mnuSubject").click(function() {

	$.ajax({
		type : "GET",
		url : "main-menu/subject",

		success : function(response) {
			$('#page-content').html(response);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
});

$("#mnuSubjectStages").click(function() {

	$.ajax({
		type : "GET",
		url : "main-menu/sub-stages",

		success : function(response) {
			$('#page-content').html(response);
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
});
