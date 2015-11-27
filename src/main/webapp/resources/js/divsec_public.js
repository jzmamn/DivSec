jQuery(function() {

	$("#divFrmOpened").hide({});

	var dtPublic = $('#dtOpened').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : ctx + "/public/loadpi",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "piId"
		}, {
			"data" : "piName"
		}, {
			"data" : "piAddress1"
		}, {
			"data" : "piAddress2"
		}, {
			"data" : "piAddress3"
		}, {
			"data" : "piLandPhone"
		}, {
			"data" : "piMobilePhone"
		}, {
			"data" : "piEmail"
		}, {
			"data" : "piNic"
		}, {
			"data" : "piDob"
		}, {
			"data" : "piGender"
		}, {
			"data" : "piNote"
		}, {
			"data" : "piUserId"
		}, {
			"data" : "piActive"
		}

		],

		"columnDefs" : [ {
			"targets" : [ 7 ],
			"visible" : false
		}, {
			"targets" : [ 8 ],
			"visible" : false
		}, {
			"targets" : [ 9 ],
			"visible" : false
		}, {
			"targets" : [ 10 ],
			"visible" : false
		}, {
			"targets" : [ 11 ],
			"visible" : false
		}, {
			"targets" : [ 12 ],
			"visible" : false
		}, {
			"targets" : [ 13 ],
			"visible" : false
		} ]

	});

	$('#dp1').datepicker({
		format : 'mm-dd-yyyy',
		todayBtn : 'true'
	});

	$('#dtTable').dataTable({
		"lengthMenu" : [ 5, 10, 20 ],
	});

	// ----------- Opened Tab -------------

	$('#dtOpened tbody').on('click', 'tr', function(e) {
		$("#divFrmOpened").show({});
		$('#divOpened').hide({});
	});

	// $("#idTabOpened").click(function() {
	// $("#divFrmOpened").hide({});
	// $('#divOpened').show({});
	// });

	// -----------End Opened Tab -------------

	$("#idBtnAddPublic").click(function() {
		$("#divFrmOpened").show({});
		$('#divOpened').hide({});
	});

	$("#idBtnViewPublic").click(function() {
		$("#divFrmOpened").hide({});
		$('#divOpened').show({});
	});

	// ========== Load Gender Dropdown List============
	var $gender = $('#idGender');
	// request the JSON data and parse into the select element
	$.ajax({
		// url : ctx + '/resources/json/gender.json',
		url : ctx + '/gender/load',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$gender.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$gender.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none available' option
			$gender.html('<option id="-1">none available</option>');
		}
	});

	// ========== End Load Gender Dropdown List============

	// ========== Get Value From Gender Dropdown List ============

	$gender.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $('#idGender').children(":selected").attr("id");
		str2 = $('#idGender').val();
		$("select option:selected").each(function() {
			$("#genderId").text(str1);
			$("#genderName").text(str2);
		});

	}).trigger("change");

	// ========== Get Value From Gender Dropdown List============

	// ========== Load Notification Dropdown List============
	var $notification = $('#idNotification');
	// request the JSON data and parse into the select element
	$.ajax({
		// url : ctx + '/resources/json/notification.json',
		url : ctx + '/notification/load',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$notification.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$notification.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none available' option
			$notification.html('<option id="-1">none available</option>');
		}
	});

	// ========== End Load Notification Dropdown List============

	// ========== Get Value From Notification Dropdown List============

	$notification.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $('#idNotification').children(":selected").attr("id");
		str2 = $('#idNotification').val();

		$("select option:selected").each(function() {
			$("#notificationId").text(str1);
			$("#notificationName").text(str2);
		});

	}).trigger("change");

	// ========== Get Value From Notification Dropdown List============
});
