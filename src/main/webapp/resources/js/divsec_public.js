jQuery(function() {

	var $gneder = $('#idGender');
	var $notification = $('#idNotification');
	// request the JSON data and parse into the select
	// element
	// Load Gender Drop down
	$.ajax({
		url : 'person.JSON',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the
			// select
			$gneder.html('');
			// iterate over the data and append a
			// select option
			$gneder.append('<option id="-1"> Select your division</option>');
			$.each(data, function(key, val) {
				$gneder.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none
			// available' option
			$gneder.html('<option id="-2">Error in gender selection</option>');
		}
	});

	// Load Notification Drop down
	$.ajax({
		url : 'person.JSON',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the
			// select
			$notification.html('');
			// iterate over the data and append a
			// select option
			$notification
					.append('<option id="-1"> Select your division</option>');
			$.each(data, function(key, val) {
				$notification.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none
			// available' option
			$notification
					.html('<option id="-2">Error in Notification</option>');
		}
	});

	$gneder.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $(this).children(":selected").attr("id");

		$("select option:selected").each(function() {
			str2 = $(this).text() + " ";
			$("#id").text(str1);
			$("#name").text(str2);
		});
	}).trigger("change");

	$notification.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $(this).children(":selected").attr("id");

		$("select option:selected").each(function() {
			str2 = $(this).text() + " ";
			$("#id").text(str1);
			$("#name").text(str2);
		});
	}).trigger("change");

});
