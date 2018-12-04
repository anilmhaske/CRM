<style type="text/css">
	
</style>
<div class="collapse" id="customercollapseExample">
	<form class="well" name="adcustomerform" role="form" novalidate autocomplete="off">
		<div class="panel panel-default" style="margin-bottom: 0px;">
			<div class="panel-body">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="row">
							<div class="col-sm-12">
								<span style="font-weight: 700;">Enquiry Information</span>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="row form-group">
							<div class="col-sm-2">
								<small><label> Customer Name<span style="color:red;">*</span> :</label></small>
							</div>
							<div class="col-sm-4">
								<input type="text" name="encustname" id="encustname" ng-model="encustname" placeholder="customer name" class="form-control" required ng-change="searchenqcustomer()" onclick="custonclick('encustname','enqcust_error');">
								<div id="searchenqcustomerdiv" style="display: none;">
									<div id="custenqdropdownloader"></div>
									 <small ng-repeat="option in enqcustomerinfo" class="enqcustsearch" ng-click="getselectedenqcustomer(option.DisplayName,option.AccountID)">
										{{option.DisplayName}}<hr></small>
									</div> 
								<input type="text" id="enqcustid" style="display: none;"> 
								<small id="enqcust_error" style="color:red;"></small>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-sm-2">
								<small><label>Enquiry Source<span style="color:red;">*</span> :</label></small>
							</div>
							<div class="col-sm-4">
								<select ng-options="enname.ID as enname.Name for enname in enqsrcname" data-ng-model="enqsrcname.ID" class="form-control" style="padding:5px 12px" id="custenqsource" required onchange="custonclick('custenqsource','enqsource_error');">
								<option value=''>-----Select enquiry source-----</option>
							</select>
							<small id="enqsource_error" style="color:red;"></small>
							</div>
							<div class="col-sm-2">
								<small><label>Enquiry for transation :</label></small>
							</div>
							<div class="col-sm-4">
								<select class="form-control" id="enqtransition">
									<option value="1">Purchase</option>
									<option value="2">Sale</option>
								</select>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-2">
								<small><label>Enquiry for product<span style="color:red;">*</span> :</label></small>
							</div>
							<div class="col-sm-4" id="productcommgrouppopover">
								<div class="selectBox"  ng-click="showproductnames()" style=" margin-bottom:5px;">
									<button id="testprojectgroup" name="testprojectgroup" class="form-control removedata" style="background-color:white ;padding-top:5px;font-size:14px;border:1px solid #ccc;color: #555;border-radius:0;">
										<h5 id="productcount" style="margin-top:2px;text-align:left;padding-left:1%;">Select Product
										</h5>
										<span class="caret" id="productcaret" style="height:15px;float:right;   margin-top: -19px;">
										</span>
									</button>
									<div id="productbox" class="col-sm-11" style="display: block; background-color: white;z-index:500;position:absolute;width: 91%;border:1px solid silver;display:none;overflow: scroll;max-height: 175px;min-height: 100px;font-size: 12px;" auto-close="outsideClick">
										<input disable-auto-close type="search" ng-model="searchproname" class="form-control" placeholder="Search" id="searchproname" name="searchproname" style="margin-top:5px;" ><span class="glyphicon glyphicon-remove-sign" style="float: right;margin-top: -24px;" ng-click="removeproductsearch()"></span></input>
										<ul style="margin-left: -37px;" id="testprojectgroupul" >
											<li>
												<label for="one">
													<input name="chkgroup" value="all" class="chk" type="checkbox" id="allproductchkall" ng-click="selectallproduct()" /><span class="touchcheckbox" >&nbsp;Select All</span>
												</label>
											</li>
											<li ng-repeat = "data in enqproductname | filter:searchproname" id="dynamicproid">
												<label for="one">
													<input name="chkgroup" class="chk" type="checkbox" id="pro_{{data.ProductID}}" ng-model="data.checked" ng-click="getenquiryproductid(data.ProductID)" /><span class="touchcheckbox" >&nbsp;{{data.DisplayName}}</span>
												</label>
											</li>
										</ul>
									</div>
								</div> 
								<small class="mandclass" id="testprojectname_error"></small>
							</div>
							<!-- <div class="col-sm-4">
								<multiselect class="input-xlarge multiselect" ng-model="option1" options="p.ProductID as p.DisplayName for p in enqproductname" header="Select Product" selected-header="options selected" multiple="true" enable-filter="true" filter-placeholder="Product Name">
								</multiselect>

								<pre id="values" ng-bind="option1 | json" ng-hide="true"></pre>
								<small id="enqproduct_error" style="color:red;"></small>
							</div> -->
							<div class="col-sm-2"><small><label>Enquiry Date & Time:</label></small>
							</div>
							<div class="col-sm-2">
								<small><label>Date<span style="color:red;">*</span> :</label></small><input type="text" name="enqdata" id="enqdata" placeholder="DD-MM-YYYY" class="form-control" onclick="custonclick('enqdata','enqdate_error');">
								<small id="enqdate_error" style="color:red;"></small>
							</div>
							<div class="col-sm-2">
								<small><label>Time :</label></small>
								<input type="time" name="enqtime" id="enqtime" placeholder="" class="form-control">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-2">
								<small><label>Visit Type :</label></small>
							</div>
							<div class="col-sm-4">
								<select class="form-control" id="visittype">
									<option value="1">Fixed</option>
									<option value="2">Tentative</option>
								</select>
							</div>
							<div class="col-sm-2">
								<small><label>Date of Visit :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="enqvisidate" id="enqvisidate" placeholder="DD-MM-YYYY" class="form-control" onclick="custonclick('enqvisidate','enqvisitedate_error');">
								<small id="enqvisitedate_error" style="color:red;"></small>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-2"><small><label>Member Count :</label></small>
							</div>
							<div class="col-sm-2">
								<small><label>Adult Count :</label></small>
								<input class="form-control" type="number" name="adlmembercnt" id="adlmembercnt" ng-model="adlmembercnt" min="0">
							</div>
							<div class="col-sm-2">
								<small><label>Child Count :</label></small>
								<input class="form-control" type="number" name="chlmembercnt" id="chlmembercnt" ng-model="chlmembercnt" min="0">
							</div>
							<div class="col-sm-2">
								<small><label>Group Type :</label></small>
							</div>
							<div class="col-sm-4">
								<select ng-options="grpname.ID as grpname.Name for grpname in enqgroupname" data-ng-model="enqgroupname.ID" id="enqgrptype" class="form-control" style="padding:5px 12px" >
								<option value=''>-----Select group type-----</option>
							</select>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-2">
								<small><label>Requirments :</label></small>
							</div>
							<!-- <div class="col-sm-4">
								<select id="requirments" multiple="multiple">
								    <option value="Product_ID">Lodging</option>
								    <option value="Product_Name">Non-Veg</option>
								    <option value="Brand">Liquor</option>
								    <option value="Category">Hurda</option>
								</select>
							</div> -->

							<div class="col-sm-4" id="requirgrouppopover">
								<div class="selectBox"  ng-click="showrequirementnames()" style=" margin-bottom:5px;">
									<button id="requigroup" name="requigroup" class="form-control" style="background-color:white ;padding-top:5px;font-size:14px;border:1px solid #ccc;color: #555;border-radius:0;">
										<h5 id="requirementcount" style="margin-top:2px;text-align:left;padding-left:1%;">Select Requirement
										</h5>
										<span class="caret" id="reqcaret" style="height:15px;float:right;   margin-top: -19px;">
										</span>
									</button>
									<div id="requirementbox" class="col-sm-11" style="display: block; background-color: white;z-index:500;position:absolute;width: 91%;border:1px solid silver;display:none;overflow: scroll;max-height: 175px;min-height: 100px;font-size: 12px;" auto-close="outsideClick">
										<input disable-auto-close type="search" ng-model="searchrequirename" class="form-control" placeholder="Search" id="searchrequirename" name="searchrequirename" style="margin-top:5px;" ><span class="glyphicon glyphicon-remove-sign" style="float: right;margin-top: -24px;" ng-click="removerequiremsearch()"></span></input>
										<ul style="margin-left: -37px;" id="requirementgroupul" >
											<li>
												<label for="one">
													<input name="chkgroup" value="all" class="chkrequ" type="checkbox" id="allrequirementchkall" ng-click="selectallrequirements()" /><span class="touchcheckbox" >&nbsp;Select All</span>
												</label>
											</li>
											<li ng-repeat = "data in enqrequirements | filter:searchrequirename" id="dynamicrequirememntid">
												<label for="one">
													<input name="chkgroup" class="chkrequirement" type="checkbox" id="req_{{data.ID}}" ng-model="data.checked" ng-click="getenquiryrequirementid(data.ID)" /><span class="touchcheckbox" >&nbsp;{{data.Name}}</span>
												</label>
											</li>
										</ul>
									</div>
								</div> 
								<small style="color:red;" id="requirements_error"></small>
							</div>
							<div class="col-sm-2">
								<small><label>Assigned To :</label></small>
							</div>
							<div class="col-sm-4">
								<select ng-options="asnme.AccountID as asnme.DisplayName for asnme in salesman" data-ng-model="salesman.AccountID" id="enqgrptype" class="form-control" style="padding:5px 12px" >
								<option value=''>-----Select Name-----</option>
							</select>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-2">
								<small><label>Remark :</label></small>
							</div>
							<div class="col-sm-4">
								<textarea class="form-control" rows="4" cols="25" name="remark" style=" resize: none;" id="enqremark"></textarea>
							</div>
							<div class="col-sm-2">
								<small><label>Current Status :</label></small>
							</div>
							<div class="col-sm-4" id="enqstatus">
								<select class="form-control">
									<option value="1">Open</option>
									<option value="2">Closed</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-5"></div>
					<div class="col-sm-4">
						<button type="submit" class="btn" id="addsubmitbtn" ng-click="saveenquiry()">Save</button>
						<button type="button" ng-click="resetschform()" class="btn" id="reset">Reset</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$('#productbox').click(function (e) {
		e.stopPropagation();
	});
	$('#requirementbox').click(function (e) {
		e.stopPropagation();
	});
</script>