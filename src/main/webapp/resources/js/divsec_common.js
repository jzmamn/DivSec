jQuery(function() {

	// loadUserCreationModal(userId);

	// load user setup form for the user

	function loadUser(userId) {

		$.ajax({
			type : 'GET',
			url : 'usercreation/loadbystfId/' + staffId,
			success : function(id, name) {
				alert('hi');
				alert(name);

				// $('#txtIdUCId').val(dtUser.fnGetData(aPos, 0));
				// $('#txtIdName').val(dtUser.fnGetData(aPos, 1));
				// $('#txtIdDivisionId').val(dtUser.fnGetData(aPos, 2));
				// $('#txtIdDivision').val(dtUser.fnGetData(aPos, 3));
				//
				// $('#txtIdCatId').val(dtUser.fnGetData(aPos, 4));
				// $('#txtIdCatName').val(dtUser.fnGetData(aPos, 5));
				//
				// $('#txtIdUserId').val(dtUser.fnGetData(aPos, 6));
				// $('#txtIdPwd').val(dtUser.fnGetData(aPos, 7));
				// $('#txtIdEmail').val(dtUser.fnGetData(aPos, 8));
				// $('#txtIdMobile').val(dtUser.fnGetData(aPos, 9));
				// $('#txtIdNote').val(dtUser.fnGetData(aPos, 10));

				$("#modalUserAccount").modal("show");

			},
			error : function(data) {
				alert('Please enter an instruction');
			}

		});

	}

})
