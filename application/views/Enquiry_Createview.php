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
			<table class="table table-bordered table-hover" id="schooltbl">
				<thead style="background: #D0FFb4;color:#61702B;">
					<th>SR.No</th>
					<th>Customer Name</th>
					<th>Enquiry Source</th>
					<th>Enquiry Date & Time</th>
					<th>Date of Visit</th>
					<th>Option</th>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Anil Mhaske</td>
						<td>WhatsApp</td>
						<td>10/Nov/2018 04:50 PM</td>
						<td>10/Dec/2018</td>
						<td><img src="http://localhost:8080/Anil/crmmanagement/assets/images/edit.png"></td>
					</tr>
				</tbody>
			</table>
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
</script>