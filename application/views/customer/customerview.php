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
	.table>tbody>tr>td
	{
		font-size: 12px;
	}
	.setsapntitle{
		font-weight:bold;font-size:16px;
	}
	small {
    	font-size: 75%;
	}
	.setsearchcitydiv
	{
		display: inherit;
	    padding: 5px;
	    border: 1px solid black;
	    height: 180px;
	    overflow-y: scroll;
	    width: 90%;
	    position: absolute;
	    z-index: 1000;
	    font-size: 16px;
	    background-color: rgb(255, 255, 255);
	}
	#redcolor{
		color:red;
	}
	#customersearchresult
	{
		display: inherit;
	    border: 1px solid black;
	    height: 150px;
	    overflow-y: scroll;
	   	width:48%;
	    position: absolute;
	    z-index: 1000;
	    font-size: 15px;
	    padding: 5px;
	    background-color: rgb(255, 255, 255);
	}
</style>
<div id="masterloader" class="modal" style="height: 100%;display:none;width: 100%;background-color: #0000009c;"></div>
<div class="container-fluid setfluid" ng-controller="customercontroller" style="margin-top:10px;">
	<div class="panel panel-default panelset" id="setpan">
		<div class="panel-heading" id="heading">
			<div class="row">
				<div class="col-sm-3 col-xs-2">
					<span class="setsapntitle">Customer Master</span> 
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
		<?php include('add_customer.php');?> 
		<div class="panel-body">
			<div class="table-responsive" style="overflow-y: none;" id="customertble">
				<table class="table table-bordered table-hover" id="schooltbl">
					<thead style="background: #D0FFb4;color:#61702B;">
						<th>SR.No</th>
						<th>Name</th>
						<th>Mobile Number</th>
						<th>Address</th>
						<th>Email ID</th>
						<th>Option</th>
					</thead>
					<tbody>
						<tr dir-paginate="info in custinfo|itemsPerPage:2" total-items="10">
							<td>{{$index+1}}</td>
							<td>
								<span>{{info.DisplayName}}</span>
							</td>
							<td>
								<span ng-if="Contactdetail == ''">-</span>
								<span ng-if="Contactdetail != ''">{{info.Contactdetail}}</span>
							</td>
							<td>
								<span ng-if="Addressline1 == ''">-</span>
								<span ng-if="Addressline1 != ''">{{info.Addressline1}} {{info.Addressline2}} {{info.Addressline3}} {{info.Addressline4}} {{info.Addressline5}}</span>
							</td>
							<td>
								<span ng-if="emailid == ''">-</span>
								<span ng-if="emailid != ''">{{info.emailid}}</span>
							</td>
							<td><img src="http://localhost:8080/Anil/crmmanagement/assets/images/edit.png" ng-click="editcustomer(info.AccountID,info.ClientID)"></td>
						</tr>
						<tr ng-if="schooldata==''">
							<td colspan="6">
									No customer data available..
							</td>
						</tr>
					</tbody>
				</table>
				<div>
					<dir-pagination-controls class="pull-right" template-url="/dirPagination.html" on-page-change="schoolpagination(newPageNumber)" direction-links="true" boundary-links="true"></dir-pagination-controls>
       					
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
	$('#custdob').datepicker({
		yearRange: '1900:+0',
		dateFormat: 'dd-M-yy',
		changeMonth: true,
		changeYear: true,
		maxDate: new Date()
	});
	$('#custdoanniv').datepicker({
		yearRange: '1900:+0',
		dateFormat: 'dd-M-yy',
		changeMonth: true,
		changeYear: true,
		maxDate: new Date()
	});
	
</script>