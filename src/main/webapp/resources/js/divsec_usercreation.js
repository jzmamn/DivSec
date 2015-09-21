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

		]

	// ,
	//
	// "columnDefs" : [ {
	// "targets" : [ 2 ],
	// "visible" : false
	// }, {
	// "targets" : [ 4 ],
	// "visible" : false
	// }, {
	// "targets" : [ 7 ],
	// "visible" : false
	// }
	//
	// ]

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

	$("#btn").click(function() {
		// alert('usercreation/loaduser');
		// $.ajax({
		// url : 'usercreation/loaduser',
		// dataType : "json"
		// }).done(function(json) {
		// alert("Success: " + json);
		// });

	});

	// GET VALUE ON TABLE ROW CLICK From Staff table

	$('#dtUser tbody').on('click', 'tr', function(e) {

		var aPos = dtUser.fnGetPosition(this);
		alert(aPos);
		$('#txtIdUCId').val(dtUser.fnGetData(aPos, 0));
		$('#txtIdName').val(dtUser.fnGetData(aPos, 1));
		$('#txtIdCatId').val(dtUser.fnGetData(aPos, 2));
		$('#txtIdCatName').val(dtUser.fnGetData(aPos, 3));
		$('#txtIdDivisionId').val(dtUser.fnGetData(aPos, 4));
		$('#txtIdDivision').val(dtUser.fnGetData(aPos, 5));
		$('#txtIdUserId').val(dtUser.fnGetData(aPos, 6));
		$('#txtIdPwd').val(dtUser.fnGetData(aPos, 7));
		$('#txtIdEmail').val(dtUser.fnGetData(aPos, 8));
		$('#txtIdMobile').val(dtUser.fnGetData(aPos, 9));
		$('#txtIdNote').val(dtUser.fnGetData(aPos, 10));

		var varChkActive = dtUser.fnGetData(aPos, 11);

		if (varChkActive == true) {
			blnIsDivActive = true;
		} else {
			blnIsDivActive = false;
		}

		$('#chkUserIsActive').prop('checked', blnIsDivActive);

		$("#modalUser").modal("show");

	});

	// =======================START DIVISION MODAL=========================

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

	// GET VALUE ON TABLE ROW CLICK FROM DIVISION TABLE
	$('#dtDivision tbody').on('click', 'tr', function(e) {
		var data = $(this).children("td").map(function() {
			return $(this).text();
		}).get();

		$('#txtIdDivisionId').val(data[0]);
		$('#txtIdDivision').val(data[1]);

		$("#modalDivision").modal("hide");

	});

	$("#btnIdShowDiv").click(function() {
		dtDivision.fnReloadAjax('division/create1');
	});

	// =======================END DIVISION MODAL=========================

	// =======================START USER CATEGORY MODAL=========================

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

	// GET VALUE ON TABLE ROW CLICK FROM USER CATEGORY TABLE
	$('#dtCategory tbody').on('click', 'tr', function(e) {

		var data = dtUserCat.fnGetTd($('#dtCategory tbody tr:eq(1)')[0], 1);
		alert(data);

		// var data = $(this).children("tr").map(function() {
		// return $(this).text();
		// }).get();
		//
		// alert(data);
		// //
		//
		// $('#txtIdCatId').val(data[0]);
		// $('#txtIdCatName').val(data[1]);
		//
		// $("#modalCategory").modal("hide");

	});

	$("#btnIdUserCat").click(function() {
		dtUserCat.fnReloadAjax('usercategory/loadCategory');
	});

	// =======================END USER CATEGORY MODAL=========================

});
