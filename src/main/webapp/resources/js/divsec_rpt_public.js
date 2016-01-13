jQuery(function() {

	// Load datatable
	var dtPublic = $('#dtOpened').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 40 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "rptpublic/loadpi",
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
			"data" : "notification.ntnId"
		}, {
			"data" : "notification.ntnType"
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
		}, {
			"targets" : [ 14 ],
			"visible" : false
		} ],
		dom : 'Bfrtip',
		buttons : [ {
			extend : 'copyHtml5',
			exportOptions : {
				columns : [ 0, ':visible' ]
			}
		}, {
			extend : 'excelHtml5',
			exportOptions : {
				columns : ':visible'
			}
		},

		{
			extend : 'pdfHtml5',

		}, 'colvis',

		{
			text : 'Filter',
			action : function(e, dt, node, config) {
				alert('Button activated');
			}
		}, {
			extend : 'print',
			message : 'Request List',
			exportOptions : {
				columns : ':visible'
			}

		} ]

	});

	$('#dp1').datepicker({
		format : 'yyyy-mm-dd',
		todayHighlight : true,
		todayBtn : 'true'
	});

	$('#dtTable').dataTable({
		"lengthMenu" : [ 5, 10, 20 ],
	});

	// ----------- Opened Tab -------------

	$('#dtOpened tbody').on('click', 'tr', function(e) {

		var aPos = dtPublic.fnGetPosition(this);
		// alert(aPos);
		$('#txtIdPubId').val(dtPublic.fnGetData(aPos, 0));
		$('#txtIdName').val(dtPublic.fnGetData(aPos, 1));
		$('#txtIdAdd1').val(dtPublic.fnGetData(aPos, 2));
		$('#txtIdAdd2').val(dtPublic.fnGetData(aPos, 3));
		$('#txtIdAdd3').val(dtPublic.fnGetData(aPos, 4));
		$('#txtIdTel').val(dtPublic.fnGetData(aPos, 5));
		$('#txtIdMobile').val(dtPublic.fnGetData(aPos, 6));
		$('#txtIdEmail').val(dtPublic.fnGetData(aPos, 7));
		$('#txtIdNic').val(dtPublic.fnGetData(aPos, 8));
		$('#dp1').val(dtPublic.fnGetData(aPos, 9));
		$('#genderName').val(dtPublic.fnGetData(aPos, 10));
		$('#txtIdNote').val(dtPublic.fnGetData(aPos, 11));
		// $('#txtIdUid').val(dtPublic.fnGetData(aPos, 12));
		$('#txtIdUid').val(stfId);
		$('#notificationId').val(dtPublic.fnGetData(aPos, 13));
		$('#notificationName').val(dtPublic.fnGetData(aPos, 14));

		$('#idNotification').val(dtPublic.fnGetData(aPos, 14));

		var varChkActive = dtPublic.fnGetData(aPos, 15);

		if (varChkActive == true) {
			blnIsDivActive = true;
		} else {
			blnIsDivActive = false;
		}

		$('#chkIdPiActive').prop('checked', blnIsDivActive);

		$("#divFrmOpened").show({});
		$('#divOpened').hide({});
	});

	// $("#idTabOpened").click(function() {
	// $("#divFrmOpened").hide({});
	// $('#divOpened').show({});
	// });

	// -----------End Opened Tab -------------

	$("#idBtnAddPublic").click(function() {
		resetForm();
		$("#divFrmOpened").show({});
		$('#divOpened').hide({});

	});

	$("#idBtnViewPublic").click(function() {
		dtPublic.fnReloadAjax('public/loadpi');
		$("#divFrmOpened").hide({});
		$('#divOpened').show({});
	});

	// ========== Load Gender Dropdown List============
	var $gender = $('#idGender');
	// request the JSON data and parse into the select element

	$.ajax({
		// url : contextPath + '/gender/load',
		url : 'gender/load',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$gender.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				// alert(val.id + " " + val.gender);
				$gender.append('<option id="' + val.id + '">' + val.gender
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
			$("#genderName").val(str2);
		});

	}).trigger("change");

	// ========== Get Value From Gender Dropdown List============

	// ========== Load Notification Dropdown List============
	var $notification = $('#idNotification');
	// request the JSON data and parse into the select element
	$.ajax({
		// url : contextPath + '/notification/load',
		url : 'notification/load',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$notification.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$notification.append('<option id="' + val.ntnId + '">'
						+ val.ntnType + '</option>');
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
			$("#notificationId").val(str1);
			$("#notificationName").val(str2);
		});

	}).trigger("change");

	// ========== Get Value From Notification Dropdown List============

	// ========== Reset entire form ============

	function resetForm() {
		$('#txtIdPubId').val("");
		$('#txtIdName').val("");
		$('#txtIdAdd1').val("");
		$('#txtIdAdd2').val("");
		$('#txtIdAdd3').val("");
		$('#txtIdTel').val("");
		$('#txtIdMobile').val("");
		$('#txtIdEmail').val("");
		$('#txtIdNic').val("");
		$('#dp1').val("");
		$('#idGender').val("");
		$('#genderName').val("");
		$('#txtIdNote').val("");
		// $('#txtIdUid').val(dtPublic.fnGetData(aPos, 12));
		$('#txtIdUid').val(stfId);
		$('#notificationId').val("");
		$('#notificationName').val("");
		$('#idNotification').val("");
	}
	// ==========End Reset entire form ============

	// Form submission save and edit
	$("#frmIdPublic").submit(function() {
		// the Controller request mapping value as url.
		var url = "public/create";
		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdPublic").serialize(),
			success : function() {
				dtPublic.fnReloadAjax('public/loadpi');
				swal("Saved Sucessfully !", "....", "success");
			},

			fail : function(data) {

				swal("Save Failed !", "....", data);
			}
		});

		// avoid to execute the actual submit of the form.
		return false;
	});

});
