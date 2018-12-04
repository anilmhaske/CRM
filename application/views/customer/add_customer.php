 <style>
 .popover {
      border: 1px solid darkgrey;
  }
  .popover-title {
      background-color: #c2e1f1;
      color:#31708f;
      font-size: 20px;
  }
  .popover-content {
      //background-color: #fdfbed;
      background-color: #fff;
      //color: #FFFFFF;
      padding: 15px;
  }
  .arrow {
      border-right-color: #efe8b4e0;
  }
  #closepop{
  cursor:pointer;
  }
 .errormsg{
 	color: red;
 }
</style>
<div class="collapse" id="customercollapseExample">
	<form class="well" name="adcustomerform" role="form" novalidate autocomplete="off">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="panel panel-info" style="margin-bottom: 5px;">
					<div class="panel-heading">
						<div class="row">
							<div class="col-sm-12">
								<span class="glyphicon glyphicon-user"></span>&nbsp;<span style="font-weight: 700;">Customer Information</span> 
							</div>
						</div>
					</div>
					<div class="panel-body">
						<div class="row form-group">
							<div class="col-sm-1">
								<small><label> Mobile Number<span style="color:red;">*</span>:</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="custmobileno" id="custmobileno" ng-model="custmobileno" ng-pattern="/^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$/" placeholder="Enter Mobile number" class="form-control" ng-change="mobilevalidation()" ng-model="custmobileno" onclick="custonclick('custmobileno','custmob_error');" required>
								<input type="text" name="custmobavaible" id="custmobavaible" style="display:none;" />
								<small id="custmob_error" style="color:red;"></small>
							</div>
							<div class="col-sm-2">
								<a ng-show="canmobavialble ==1" style="text-decoration: none;border-bottom: 1px solid green;" ng-click="verifycustmobile()">Check availability</a>
								<a href="#" id="viewcustmobdetails" style="text-decoration:none;display: none;" data-toggle="popover" data-trigger="click"><span>View Details</span></a>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-1">
								<small><label>Group Name :</label></small>
							</div>
							<div class="col-sm-3">
								<!-- <select class="form-control" id="custgroupname">
									<option value="0">Select group name</option>
									<option value="1">Friends</option>
									<option value="2">Corporate</option>
									<option value="3">Family</option>
								</select> -->

								<select ng-options="gname.ID as gname.Name for gname in cgroupname" data-ng-model="cgroupname.ID"
								class="form-control" style="padding:5px 12px" >
								<option value=''>-----Select group name-----</option>
							</select>
							</div>

							<div class="col-sm-1">
								<small><label>Cust/Sup Name<span style="color:red;">*</span> :</label></small>
							</div>
							<div class="col-sm-5">
								<input type="text" name="custname" id="custname" ng-model="custname" ng-pattern="/^[a-zA-Z ]*$/" placeholder="Enter name" class="form-control" onclick="custonclick('custname','custname_error');" required>
								<small id="custname_error" style="color:red;"></small>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-1">
								<small><label>Landline Number :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="custlandno" id="custlandno" ng-model="custlandno" ng-pattern="/^\(0\d{1,2}\)\d{3}-\d{4}$/" placeholder="Enter landline number" class="form-control" onclick="custonclick('custlandno','custlandline_error');">
								<small id="custlandline_error" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>Company Name :</label></small>
							</div>
							<div class="col-sm-5">
								<input type="text" name="custcompname" id="custcompname" placeholder="Enter company name" class="form-control" >
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-1">
								<small><label>Date of Birth :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="custdob" id="custdob" placeholder="DD/MM/YYYY" class="form-control" onclick="custonclick('custdob','custdob_error');">
								<small id="custdob_error" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>Date of Anniversary</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="custdoanniv" id="custdoanniv" placeholder="DD/MM/YYYY" class="form-control" onclick="custonclick('custdoanniv','custanniv_error');">
								<small id="custanniv_error" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>GST No / PAN No :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="custgstpanno" id="custgstpanno" placeholder="Enter GST / PAN NO" class="form-control" style="text-transform:uppercase" onclick="custonclick('custgstpanno','custgstpan_error');">
								<small id="custgstpan_error" style="color:red;"></small>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-1">
								<small><label>Email ID :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="custemail" id="custemail" ng-model="custemail" ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/" placeholder="Enter email" class="form-control" onclick="custonclick('custemail','custemail_error');">
								<small id="custemail_error" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>Alternate Email ID :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="custaltemail" id="custaltemail" ng-model="custaltemail" ng-pattern="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/" placeholder="Enter alternate email" class="form-control" onclick="custonclick('custaltemail','custaltemail_error');">
								<small id="custaltemail_error" style="color:red;"></small>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-info" style="margin-bottom: 5px;">
							<div class="panel-heading">
								<div class="row">
									<div class="col-sm-12">
										<span style="font-weight: 700;"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Address Information</span> 
									</div>  
								</div>
							</div>
							<div class="panel-body">
								<div class="row form-group">
									<div class="col-sm-1">
										<small><label>Address Line 1 <span style="color:red;">*</span> :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="adrline1_1_1" ng-model="adrline1_1_1" id="adrline1_1_1" placeholder="Enter Address line 1" class="form-control" onclick="custonclick('adrline1_1_1','1_Msg_address_1');" required>
										<small id="1_Msg_address_1" style="color:red;"></small>
									</div>
									<div class="col-sm-1">
										<small><label>Address Line 2 :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" id="adrline2_1_1" name="adrline2_1_1" placeholder="Enter Address line 2" class="form-control">
									</div>
									<div class="col-sm-1">
										<small><label>Address Line 3 :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="adrline3_1_1" id="adrline3_1_1" placeholder="Enter Address line 3" class="form-control">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-sm-1">
										<small><label>Country :</label></small>
									</div>
									<div class="col-sm-3" onclick="loadstate(1,-1,1);" >
										<select id="country_1_1" name="country_1_1" class="form-control" ng-model="AllCountryID" Onchange="countrychange(1);">
											<option ng-repeat="country in countries" ng-selected ="{{country == AllCountryID}}" value="{{country.CountryID}}">
												{{country.Name}}
											</option>
										</select>
									</div>
									<div class="col-sm-1">
										<small><label>State :</label></small>
									</div>
									<div class="col-sm-3">
										<select  style="padding:0px 12px" id="state_1_1" class="form-control" onchange="hidecityvalue1('city_1_',1)">
			            				</select>
									</div>
									<div class="col-sm-1">
										<small><label>City <span style="color:red;">*</span>:</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" id="city_1_1" name="city_1_1" required ng-model="city_1_1" ng-pattern="/^[a-zA-Z]*$/" placeholder="City" class="form-control removedata" ng-keyup="searchcity(city_1_1,1,1)" autocomplete="off" ng-click="displaycity(city_1_1,1,1);" onclick="custonclick('city_1_1','1_City_Msg_1');">
											<div id="searchcitylist_1" style="display:none">
												<div id="dropdownloader1"></div>
											 <small ng-repeat="option in AllCity" class="citysearch" ng-click="getselectedcity(option.Name,option.CityID,option.StateID,1)">
												  {{option.Name}}<hr></small>
											</div>
										<span id="citynottext_1" style="display: none;"><small style="color:red;">City not fount.</small> <b style="color:blue;text-decoration: underline;" ng-click="createnewcity('city_1_1',1)">Create City</b></span>
										<input type="text" id="citytext_1" style="display: none;"> 
										<small id="1_City_Msg_1" style="color:red;"></small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-sm-1">
										<small><label>Pincode :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="pincode_1_1" id="pincode_1_1" ng-model="pincode_1_1" ng-pattern="/^[0-9]{5,11}$/" placeholder="Enter pincode" class="form-control" onclick="custonclick('pincode_1_1','1_postcodeMsg_1');">
										<small id="1_postcodeMsg_1" style="color:red;"></small>
									</div>
									<div class="col-sm-2">
										<small><label>Make primary address :</label></small>
									</div>
									<div class="col-sm-4">
										<input type="checkbox" id="makeprimary_1" name="Isprimarydata" checked="" onclick="selectIsPrimaryData(this)">
									</div>
									
								</div>
								<div class="row" id="addmoreadr">				</div>
								<div class="row">
									<div class="col-sm-11">
										<input type="text" name="custaddressid" id="custaddressid" value="1" style="display:none;">
										<input type="text" name="checkedprimaryaddr" id="checkedprimaryaddr" style="display:none;">
									</div>
									<div class="col-sm-1">
										<a class="btn btn-sm pull-right" style="background-color: #0000ff7a;" role="button" id="addmbankbtn" title="add more address information" ng-click="addmoreaddr('addmoreadr',1)"><span style="color:white;" class="glyphicon glyphicon-plus"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-info" style="margin-bottom: 5px;">
							<div class="panel-heading">
								<div class="row">
									<div class="col-sm-12">
										<span style="font-weight: 700;"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;Bank Information</span> 
									</div>
								</div>
							</div>
							<div class="panel-body">
								<div class="row form-group">
									<div class="col-sm-1">
										<small><label>A/C holder name :</label></small>
									</div>
									<div class="col-sm-5">
										<input type="text" name="acname_1_1" id="acname_1_1" placeholder="Enter A/C Name" class="form-control" onclick="custonclick('acname_1_1','1_Msg_acname_1');">
										<small id="1_Msg_acname_1" style="color:red;"></small>
									</div>
									<div class="col-sm-1">
										<small><label>Bank Name :</label></small>
									</div>
									<div class="col-sm-5">
										<input type="text" name="bankname_1_1" id="bankname_1_1" placeholder="Enter bank name" class="form-control" onclick="custonclick('bankname_1_1','1_Msg_bankname_1');">
										<small id="1_Msg_bankname_1" style="color:red;"></small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col-sm-1">
										<small><label>Account No :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="acno_1_1" id="acno_1_1" placeholder="Enter bank account number" class="form-control" onclick="custonclick('acno_1_1','1_Msg_bankacno_1');">
										<small id="1_Msg_bankacno_1" style="color:red;"></small>
									</div>
									<div class="col-sm-1">
										<small><label>IFSC Code :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="ifsc_1_1" id="ifsc_1_1" ng-model="ifsc_1_1" ng-pattern="/^[A-Za-z]{4}\d{7}$/" placeholder="Enter IFSC code" class="form-control" onclick="custonclick('ifsc_1_1','1_Msg_ifsc_1');">
										<small id="1_Msg_ifsc_1" style="color:red;"></small>
									</div>
									<div class="col-sm-1">
										<small><label>IFSC Branch :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="ifscbranch_1_1" id="ifscbranch_1_1"placeholder="Enter IFSC branch" class="form-control">
									</div>
								</div>
								<div class="row form-group">
									<div class="col-sm-1">
										<small><label>IFSC City:</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="ifsccity_1_1" id="ifsccity_1_1" placeholder="Enter IFSC city" class="form-control">
									</div>
									<div class="col-sm-1">
										<small><label>SWIFT Code :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="swift_1_1" id="swift_1_1" ng-model="swift_1_1" ng-pattern="/^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/" placeholder="Enter SWIFT code" class="form-control" onclick="custonclick('swift_1_1','1_Msg_swift_1');" style="text-transform:uppercase">
										<small id="1_Msg_swift_1" style="color:red;"></small>
									</div>
									<div class="col-sm-1">
										<small><label>UPI ID :</label></small>
									</div>
									<div class="col-sm-3">
										<input type="text" name="upiid_1_1" id="upiid_1_1" ng-model="upiid_1_1" ng-pattern="/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/" placeholder="Enter UPI ID" class="form-control" onclick="custonclick('upiid_1_1','1_Msg_upi_1');">
										<small id="1_Msg_upi_1" style="color:red;"></small>
									</div>
								</div>
								<div class="row" id="addmorebank"></div>
								<div class="row">
									<div class="col-sm-11"><input type="text" name="cntbankdetails" value="1" id="cntbankdetails" style="display:none;"></div>
									<div class="col-sm-1">
										<a class="btn btn-sm pull-right" style="background-color: #0000ff7a;" role="button" id="addbnkcustdtls" title="add more bank information" ng-click="addmorebankdetails('addmorebank',1)"><span style="color:white;" class="glyphicon glyphicon-plus"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-5"></div>
					<div class="col-sm-4">
						<button type="submit" class="btn" id="addsubmitbtn"  ng-click="createcustomer()">Save</button>
						<button type="button" ng-click="resetcustomerform()" class="btn" id="reset">Reset</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
