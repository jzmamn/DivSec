jQuery(function() {
	// $('#chkIdDivActive').prop('checked', true); // check true when loading

	// Intialize Data Table

	var dtUser = $('#dtUser').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "usercreation/loaduser",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "stfId"
		}, {
			"data" : "stfName"
		}, {
			"data" : "userCategory.catId"
		}, {
			"data" : "userCategory.catName"
		}, {
			"data" : "division.divId"
		}, {
			"data" : "division.divName"
		}, {
			"data" : "stfUserId"
		}, {
			"data" : "stfPassword"
		}, {
			"data" : "stfEmail"
		}, {
			"data" : "stfMobile"
		}, {
			"data" : "stfNote"
		}, {
			"data" : "stfActive"
		}

		],

	// "columnDefs" : [ {
	// "targets" : [ 3 ],
	// "visible" : false
	// } ]

	});

	// Intialize Division Data Table

	var dtDivision = $('#dtDivision').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "division/create1",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "divId"
		}, {
			"data" : "divName"
		}, {
			"data" : "divActive"
		}

		]

	});

	// Intialize User Category Table

	var dtUserCat = $('#dtCategory').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "usercategory/loadCategory",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "catId"
		}, {
			"data" : "catName"
		}

		],

		"columnDefs" : [ {
			"targets" : [ 0 ],
			"visible" : false
		} ]

	});

	// Form submission save and edit
	$("#frmIdUser").submit(function() {
		// the Controller request mapping value as url.
		var url = "division/create";
		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdUser").serialize(),
			success : function() {
				$("#modalUser").modal("hide");
				// window.location.reload();
				dtUser.fnReloadAjax('usercreation/loaduser');
				swal("Saved Sucessfully !", "....", "success");
			},

			fail : function() {
				$("#modalUser").modal("hide");
				swal("Save Failed !", "....", "error");
			}
		});

		// avoid to execute the actual submit of the form.
		return false;
	});

	$("#btnIdShowDiv").click(function() {
		dtDivision.fnReloadAjax('division/create1');
	});

	$("#btnIdUserCat").click(function() {
		dtUserCat.fnReloadAjax('usercategory/loadCategory');
	});

	$("#btn").click(function() {
		// alert('usercreation/loaduser');
		// $.ajax({
		// url : 'usercreation/loaduser',
		// dataType : "json"
		// }).done(function(json) {
		// alert("Success: " + json);
		// });

	});

	// GET VALUE ON TABLE ROW CLICK
	$('#dtUser tbody').on('click', 'tr', function(e) {
		var data = $(this).children("td").map(function() {
			return $(this).text();
		}).get();

		$('#txtIdUCId').val(data[0]);
		$('#txtIdName').val(data[1]);
		$('#txtIdUCId').val(data[0]);
		$('#txtIdName').val(data[1]);
		// $('#chkDivIsActive').val(data[2]);

		if (data[2] == "true") {
			blnIsDivActive = true;
		} else {
			blnIsDivActive = false;
		}

		$('#chkIdDivActive').prop('checked', blnIsDivActive);

		$("#modalDivisionSave").modal("show");

	});

});
