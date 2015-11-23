jQuery(function() {

	$("#frmProcessRequest").hide({});

	$('#dtTable').dataTable({
		"lengthMenu" : [ 5, 10, 20 ],
	// url: '/api/myData',
	// columns: [
	// {data: 'name'},
	// {data: 'position'},
	// {data: 'salary'},
	// {data: 'office'}
	// ]

	});

	oTable = $('#dtTable').dataTable();
	oTable.$('tr').click(function() {
		$("#frmProcessRequest").show({});
		$('#tblProcessRequest').hide({});
	});

	$("#idApprove").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idOpened").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idApproval").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idCompleted").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idClosed").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});

	});

	$('#dtStage').dataTable({
		"lengthMenu" : [ 5, 10, 20 ],
	});

	oTable1 = $('#dtStage').dataTable();
	oTable1.$('tr').click(function() {
		$("#idModalReqStage").modal('show');
	});

	var $select = $('#people');
	// request the JSON data and parse into the select element
	$.ajax({
		url : 'request_status_stages.JSON',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$select.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$select.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none available' option
			$select.html('<option id="-1">none available</option>');
		}
	});

	$select.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $(this).children(":selected").attr("id");

		$("select option:selected").each(function() {
			str2 = $(this).text() + " ";
			$("#id").text(str1);
			$("#name").text(str2);
		});

	}).trigger("change");

	var $select1 = $('#cmdIdReqStatus');
	// request the JSON data and parse into the select element
	$.ajax({
		url : 'request_status.JSON',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$select1.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$select1.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none available' option
			$select1.html('<option id="-1">none available</option>');
		}
	});

	$select1.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $(this).children(":selected").attr("id");

		$("select option:selected").each(function() {
			str2 = $(this).text() + " ";
			$("#idCmbReqStausId").text(str1);
			$("#idCmbReqStausName").text(str2);
		});

	}).trigger("change");

});
