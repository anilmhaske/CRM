<style type="text/css">
	.setfluid{
		padding-right: 13px;
    	padding-left: 22px;
	}
	.row-fluid 
	{
		margin-bottom: 10px;
	}
	.row {margin-bottom: 10px;}
	.table>thead>tr>th
	{
		padding: 4px;
		line-height: 1.428571;
		font-size: 14px;
	}
	.setsapntitle{
		font-weight:bold;font-size:16px;
	}
	small {
    	font-size: 75%;
	}
	input[type=number]::-webkit-inner-spin-button, 
	input[type=number]::-webkit-outer-spin-button { 
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	    margin: 0; 
	}
	multiselect {
    display: block;
}

    multiselect > .btn-group {
        min-width: 100%;
    }

    multiselect .btn { 
        width: 100%;
        background-color: #FFF;
    }

        multiselect .btn.has-error {
            border: 1px solid #a94442 !important;
            color: #db524b;
        }

    multiselect .dropdown-menu {
        max-height: 300px;
        min-width: 100%;
        overflow-y: auto;
    }

        multiselect .dropdown-menu .filter > input {
            width: 99%;
        }

        multiselect .dropdown-menu .filter .glyphicon {
            cursor: pointer;
            pointer-events: all;
        }

    multiselect .dropdown-menu {
        width: 100%;
        box-sizing: border-box;
        padding: 2px;
    }

    multiselect > .btn-group > button {
        padding-right: 20px;
    }

        multiselect > .btn-group > button > .caret {
            border-left: 4px solid transparent;
            border-right: 4px solid transparent;
            border-top: 4px solid black;
            right: 5px;
            top: 45%;
            position: absolute;
        }

    multiselect .dropdown-menu > li > a {
        padding: 3px 10px;
        cursor: pointer;
    }

        multiselect .dropdown-menu > li > a i {
            margin-right: 4px;
        }

.glyphicon-none {
   content: "\e012";
    color: transparent !important;
}
	ul li {
		list-style-type: none;
	}
</style>
<div class="container-fluid setfluid" style="margin-top:10px;">
<div class="panel panel-default panelset" id="setpan" ng-controller="enquirycreation">
	<div class="panel-heading" id="heading">
		<div class="row">
			<div class="col-sm-3 col-xs-2">
				<span class="setsapntitle">Create Enquiry</span> 
			</div>
			<div class="col-sm-7 col-xs-7">
				<div class="box-tools" style="display:inline-table">
					<div class="input-group searchinput">
						<input type="text" title="Search by name or mobile number" class="form-control input-sm searchbox" placeholder="Search by name or mobile number" name="customer_search" id="customer_search"
						ng-keyup="$event.keyCode == 13 && searchcustomer(1,'')" onkeyup="customersearch();">
						<span style="background-color: #f0ad4e;" class="input-group-addon btn" ng-click="searchcustomer(1,'')" title="Click for search"><b class="glyphicon glyphicon-search"></b>
						</span>
					</div>
				</div>
				<div id="customersearchresult"></div>
			</div>
			<div class="col-sm-2 col-xs-3"> 
				<a class="btn btn-sm pull-right" style="background-color: orange;" role="button" data-toggle="collapse"
				aria-expanded="false" aria-controls="customercollapseExample" id="addcustomerbtn">
					<span style="color:white;" class="glyphicon glyphicon-plus" id="custbtntoggle">
					</span>
				</a>
			</div>
		</div>
	</div>
	<?php include('addenquiry.php');?> 
	<div class="panel-body">
		<div class="table-responsive" style="overflow-y: none;" id="customertble">
			<table class="table table-bordered table-hover">
				<thead style="background: #D0FFb4;color:#61702B;">
					<th>Enquiry ID</th>
					<th>Customer Name</th>
					<th>Enquiry Date</th>
					<th>Source</th>
					<th>Current Status</th>
					<th>Received By</th>
				</thead>
				<tbody>
					<tr title="click for action" onClick="actiontask()">
						<td>1001</td>
						<td>Anil Mhaske</td>
						<td>01-Nov-2018</td>
						<td>Email</td>
						<td>Open</td>
						<td>Mrs.Shwera Borude</td>
					</tr>
					<tr id="actiondesc" style="display: none;">
						<td colspan="6" align="center">
							<div class="table-responsive" style="    padding-top: 10px;">
								<table class="table table-bordered" style="width:100%;">
									<thead style="background: linear-gradient(#f7d9d9 0,rgba(178, 180, 181, 0.98) 100%);">
										<tr>
											<th>Next Action</th>
											<th>Action ID</th>
											<th>Action Stage</th>
											<th>Creation Date & Created By</th>
											<th>Remark</th>
											<th>Completed on & Completed By</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><a>Closed</a></td>
											<td>1</td>
											<td>Follow Up</td>
											<td>01-Nov-2018 Shweta Borude</td>
											<td>Call</td>
											<td>01-Nov-2018 Shweta Borude</td>
										</tr>
										<tr>
											<td><a>Closed</a></td>
											<td>2</td>
											<td>Follow Up</td>
											<td>01-Nov-2018 Shweta Borude</td>
											<td>Call</td>
											<td>01-Nov-2018 Shweta Borude</td>
										</tr>
										<tr>
											<td><a>Closed</a></td>
											<td>3</td>
											<td>Follow Up</td>
											<td>01-Nov-2018 Shweta Borude</td>
											<td>Call</td>
											<td>01-Nov-2018 Shweta Borude</td>
										</tr>
										<tr>
											<td><a>Closed</a></td>
											<td>4</td>
											<td>Follow Up</td>
											<td>01-Nov-2018 Shweta Borude</td>
											<td>Call</td>
											<td>01-Nov-2018 Shweta Borude</td>
										</tr>
										<tr>
											<td><a style="text-decoration: none;border-bottom: 1px solid green;" data-toggle="modal" data-target="#myModal">Add</a></td>
											<td>1</td>
											<td>Follow Up</td>
											<td>01-Nov-2018 Shweta Borude</td>
											<td>Call</td>
											<td>-</td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title pull-left">Add New Action</h4>
					</div>
					<div class="modal-body">
						<form role="form" novalidate autocomplete="off">
							<div class="row form-group">
								<div class="col-sm-3">
									<small><label>Action stage :</label></small>
								</div>
								<div class="col-sm-6">
									<select class="form-control">
										<option value="">Select action stage</option>
										<option value="volvo">Follow Up</option>
										<option value="saab">Call</option>
										<option value="mercedes">Thanks Note</option>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-sm-3">
									<small><label>Assigned To :</label></small>
								</div>
								<div class="col-sm-6">
									<select class="form-control">
										<option value="">Select assigned to</option>
										<option value="volvo">Shweta Borude</option>
										<option value="saab">Amol Karle</option>
										<option value="mercedes">Sagar More</option>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-sm-3">
									<small><label>Action Date :</label></small>
								</div>
								<div class="col-sm-3">
									<input type="text" name="custname" id="custname" placeholder="DD/MM/YYYY" class="form-control">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-sm-3">
									<small><label>Action Time :</label></small>
								</div>
								<div class="col-sm-3">
									<input type="text" name="custname" id="custname" placeholder="HH:MM:SS" class="form-control">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-sm-3">
									<small><label>Action Remark :</label></small>
								</div>
								<div class="col-sm-6">
									<textarea cols="42" rows="5"></textarea>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-sm-3"></div>
								<div class="col-sm-6">
									<input type="checkbox" name="closedchkaction"> <small><label>Close Current Action</label></small>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-sm-3"></div>
								<div class="col-sm-4">
									<button type="submit" class="btn" id="addsubmitbtn">Save</button>
									<button type="button" ng-click="resetschform()" class="btn" id="reset">Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</div>
<script>
	$("#addcustomerbtn").click(function() {
		var trInstance = $('#customertble').find('tbody tr');
		trInstance.removeClass('redCSS');
		trInstance.find('tr:eq(0)').removeClass('greenCSS');
		$( "#customercollapseExample" ).toggle();
		var a=document.getElementById('custbtntoggle');
		if (!a.hasAttribute("target")) {

			$("#addcustomerbtn").html("<span style='color:white;' class='glyphicon glyphicon-minus' target='ok' id='custbtntoggle'></span>");
		}else{
			$("#addcustomerbtn").html("<span style='color:white;' class='glyphicon glyphicon-plus' id='custbtntoggle'></span>");
		}
	});
	 $(document).ready(function() {
        $('#example-getting-started').multiselect({
                buttonWidth: '100%', 
        });
        $('#requirments').multiselect({
                buttonWidth: '100%',    
        });
        $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
    });
	$('#enqdata').datepicker({
		yearRange: '1900:+0',
		dateFormat: 'dd-M-yy',
		changeMonth: true,
		changeYear: true,
		maxDate: new Date()
	});
	$('#enqvisidate').datepicker({
		yearRange: '1900:+0',
		dateFormat: 'dd-M-yy',
		changeMonth: true,
		changeYear: true,
		maxDate: new Date()
	});
	function actiontask()
	{
		var a = $("#actiondesc").is(":visible"); 
		if(a == false)
		{
			$("#actiondesc").show();	
		}else{
			$("#actiondesc").hide();	
		}
		
		
	}
</script>