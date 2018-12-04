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

</style>
<div class="container-fluid setfluid" style="margin-top:10px;">
<div class="panel panel-default panelset" id="setpan">
	<div class="panel-heading" id="heading">
		<div class="row">
			<div class="col-sm-3 col-xs-2">
				<span class="setsapntitle">Group Name</span> 
			</div>
			<div class="col-sm-7 col-xs-7">
				<div class="box-tools" style="display:inline-table">
					<div class="input-group searchinput">
						<input type="text" title="Search by name" class="form-control input-sm searchbox" placeholder="Search by name" name="master_search" id="master_search" ng-keyup="$event.keyCode == 13 && searchmaster(1,'')" onkeyup="customersearch();">
						<span style="background-color: #f0ad4e;" class="input-group-addon btn" ng-click="searchmaster(1,'')" title="Click for search"><b class="glyphicon glyphicon-search"></b>
						</span>
					</div>
				</div>
				<div id="mastersearchresult"></div>
			</div>
			<div class="col-sm-2 col-xs-3"> 
				<a class="btn btn-sm pull-right" style="background-color: orange;" role="button" data-toggle="collapse"
				aria-expanded="false" aria-controls="mastercollapseExample" id="addmasterbtn">
					<span style="color:white;" class="glyphicon glyphicon-plus" id="masterbtntoggle">
					</span>
				</a>
			</div>
		</div>
	</div>
	<?php include('add_master.php');?> 
	<div class="panel-body">
		<div class="table-responsive" style="overflow-y: none;" id="customertble">
			<table class="table table-bordered table-hover" id="schooltbl">
				<thead style="background: #D0FFb4;color:#61702B;">
					<th style="width: 5%;">SR.No</th>
					<th style="width: 90%;">Name</th>
					<th>Option</th>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Friends</td>
						<td><img src="http://localhost:8080/Anil/crmmanagement/assets/images/edit.png"></td>
					</tr>
					<tr>
						<td>2</td>
						<td>Corporate</td>
						<td><img src="http://localhost:8080/Anil/crmmanagement/assets/images/edit.png"></td>
					</tr>
					<tr>
						<td>3</td>
						<td>Family</td>
						<td><img src="http://localhost:8080/Anil/crmmanagement/assets/images/edit.png"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$("#addmasterbtn").click(function() {
		var trInstance = $('#customertble').find('tbody tr');
		trInstance.removeClass('redCSS');
		trInstance.find('tr:eq(0)').removeClass('greenCSS');
		$( "#mastercollapseExample" ).toggle();
		var a=document.getElementById('masterbtntoggle');
		if (!a.hasAttribute("target")) {

			$("#addmasterbtn").html("<span style='color:white;' class='glyphicon glyphicon-minus' target='ok' id='masterbtntoggle'></span>");
		}else{
			$("#addmasterbtn").html("<span style='color:white;' class='glyphicon glyphicon-plus' id='masterbtntoggle'></span>");
		}
	});
</script>