jQuery(function() {

	alert(userId);

	$.ajax({
		url : "/usercreation/loadbyuserid/" + userId,
		type : "post",
		success : function(response) {
			alert(response);

		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus, errorThrown);
			alert(textStatus);
		}

	});

});
