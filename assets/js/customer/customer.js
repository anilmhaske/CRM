app.controller('customercontroller',function($scope,$http,$compile,$rootScope){
	$scope.AllCountryID = '91';
	$scopecanmobavialble = '0';
	$("#customersearchresult").fadeOut();
	getcustdata(1);
	function getcustdata(Page)
	{
		$("#masterloader").show();
		$("#masterloader").html('<img src="assets/images/loader1.gif" alt="Wait" style="left:40%;top:30%;position:absolute;z-index:9999;height:150px;width:150px;" />');
		$http({
			method:'POST',
			url:'customer/CustomerController/getcustomerinformation',
			data:{page:Page}
		}).then(function(response){
			// console.log(response);
			$scope.custinfo = response.data.currenttable;
			getcustotherdata();
			$("#masterloader").hide();
			$("#masterloader").html('');
		});
	}
	function getcustotherdata()
	{
		loadstate(1,-1,0);
		$http({
			method:'POST',
			url:'customer/CustomerController/getcustomerdata'
		}).then(function(response){
			//console.log(response);
			$scope.countries = response.data.countryinfo.currenttable;
			$scope.states = response.data.stateinfo.currenttable;
			$scope.cgroupname = response.data.groupinfo.currenttable;
			console.log("cust group:"+JSON.stringify($scope.cgroupname));
			
		});
		
	}
	function removezeors(arrayName,arrayElement)
	{
	    for(var i=0; i<arrayName.length;i++ )
	    { 
	        if(arrayName[i]==arrayElement)
	            arrayName.splice(i,1); 
	    } 
	    return arrayName;
	 }
	function countProperties (obj)
	{
    	var count = 0;
    	for (var property in obj)
    	{
        	if (Object.prototype.hasOwnProperty.call(obj, property)) {
            	count++;
        	}
    	}
    	return count;
	}
	var limit = 4;
	$scope.addmoreaddr = function(divName,IsAdd)
	{
		var addrval = $("#custaddressid").val();
		var res = addrval.split(",");
		var aa = removezeors(res,0);
		$("#custaddressid").val('');
		$("#custaddressid").val(aa);
		var valarray = $.map(aa, function(value, index) {
		    return [value];
		});

		var counter = Math.max.apply(Math, valarray);
		var addrlength = valarray.length;
		
		if (addrlength >= limit)  
		{
          alert("You have reached to add " + limit + " address");
    	}
    	else
    	{
    		if(IsAdd == 1)
			{
				counter++;
				var Whichoperationremove=1;
				var IsAdd=1;
				loadstate(counter,IsAdd,1);	
  			}
			else
			{
				var counter=counter;
				var Whichoperationremove=0;
				var IsAdd=0;
				loadstate(counter,IsAdd,1);		
			}
			if(IsAdd==0)
			{
				var citymaster='editcity_1_'+counter;
				var countrymaster='editcountry_1_'+counter;
				var statemaster='editstate_1_'+counter;
			}
			else
			{
				var citymaster='city_1_'+counter;
				var countrymaster='country_1_'+counter;
				var statemaster='state_1_'+counter;
			}
			var newdiv = document.createElement('div');
			var div1=` <div id="nextaddrdiv_`+counter+`" > 
						<div class="row" style="margin-right: 0px;margin-left: 1px;">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="row">
										<div class="col-sm-11">
											<span style="font-weight: 700;"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Address Information</span> 
										</div> 
										<div class="col-sm-1">
											<button name="btnlist" value="remove" id="`+counter+`" class="btn btn-xs  pull-right" ng-click="removeaddr(`+counter+`,`+Whichoperationremove+`);" title="Remove address information">
												<span class="glyphicon glyphicon-trash "></span> 
											</button>
										</div> 
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group" style="margin-right: 0px;margin-left: 1px;">
							<div class="col-sm-1">
								<small><label>Address Line 1 <span style="color:red;">*</span>:</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="adrline1_1_`+counter+`" ng-model="adrline1_1_`+counter+`" onclick="custonclick('adrline1_1_`+counter+`','`+IsAdd+`_Msg_address_`+counter+`');" id="adrline1_1_`+counter+`" placeholder="Enter Address line 1" class="form-control">
								<small id="`+IsAdd+`_Msg_address_`+counter+`" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>Address Line 2 :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" id="adrline2_1_`+counter+`" placeholder="Enter Address line 2" class="form-control">
							</div>
							<div class="col-sm-1">
								<small><label>Address Line 3 :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" id="adrline3_1_`+counter+`" placeholder="Enter Address line 3" class="form-control">
							</div>
						</div>
						<div class="row form-group" style="margin-right: 0px;margin-left: 1px;">
							<div class="col-sm-1">
								<small><label>Country :</label></small>
							</div>
							<div class="col-sm-3" onclick="loadstate(`+counter+`,`+IsAdd+`,1)">
								<select id="`+countrymaster+`" class="form-control" onclick="hidecityvalueaddmore(this.id,`+counter+`)" name="`+citymaster+`" Onchange="countrychange(`+counter+`);">
									<option ng-repeat="country in countries" value="{{country.CountryID}}"
			                       >{{country.Name}}</option>
			            		</select>
							</div>
							<div class="col-sm-1">
								<small><label>State :</label></small>
							</div>
							<div class="col-sm-3">
								<select id="`+statemaster+`" class="form-control" onclick="hidecityvalueaddmore(this.id,`+counter+`)" name="`+citymaster+`">
								</select>
							</div>
							<div class="col-sm-1">
								<small><label>City <span style="color:red;">*</span>:</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" id="`+citymaster+`"  name="city_1_`+counter+`" ng-model="citygetname_`+counter+`" ng-pattern="/^[a-zA-Z]*$/" placeholder="City" class="form-control" ng-keyup="searchcity(citygetname_`+counter+`,`+counter+`,`+IsAdd+`);" autocomplete="off" ng-click="displaycity(citygetname_`+counter+`,`+counter+`,`+IsAdd+`);" onclick="custonclick('`+citymaster+`','`+IsAdd+`_City_Msg_`+counter+`');" required>
								<div id="searchcitylist_`+counter+`" style=" display: none;">
									<div id="dropdownloader`+counter+`"></div>
									<small ng-repeat="option in AllCity" ng-click="getselectedcity(option.Name,option.CityID,option.StateID,`+counter+`,`+IsAdd+`)">{{option.Name}}<hr></small>
								</div>
								<span id="citynottext_`+counter+`" style="display: none;"><small style="color:red;">City not fount.</small> <b style="color:blue;text-decoration: underline;" ng-click="createnewcity('city_1_`+counter+`')">Create City</b></span>
								<input type="text" id="citytext_`+counter+`" style="display: none;"> 
								<small id="`+IsAdd+`_City_Msg_`+counter+`" style="color:red;"></small>
							</div>
						</div>
						<div class="row form-group" style="margin-right: 0px;margin-left: 1px;">
							<div class="col-sm-1">
								<small><label>Pincode :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="pincode_1_`+counter+`" id="pincode_1_`+counter+`" placeholder="Enter pincode" class="form-control" ng-model="pincode_1_`+counter+`">
								<small id="`+IsAdd+`_postcodeMsg_`+counter+`" style="color:red;"></small>
							</div>
							<div class="col-sm-2">
								<small><label>Make primary address :</label></small>
							</div>
							<div class="col-sm-4">
								<div ng-if="`+IsAdd+`=='1'">
						 			<input type="checkbox" name="Isprimarydata" id="makeprimary_`+counter+`" onclick="selectIsPrimaryData(this)">
								</div>
								<div ng-if="`+IsAdd+`=='0'">
									<input type="checkbox" name="myCheckbox" value="'`+counter+`'" onclick="selectOnlyThis(this,0)" id="makeprimaryid_`+counter+`"/>
								</div>
							</div>
						</div>
					</div>
			 `;
			newdiv.innerHTML =div1;
			var value=$("#custaddressid").val();
			var newvalue=value+','+counter;
			$scope.counter=counter;
			$("#custaddressid").val(newvalue);
			el = document.getElementById(divName);
			angular.element(el).append( $compile(newdiv)($scope));
    	}
	}
	$scope.resetcustomerform = function()
	{
		$scope.custmobileno = '';
		$scope.custname = '';
		$scope.custlandno = '';
		$scope.custemail = '';
		$scope.custaltemail = '';
		$scope.adrline1_1_1 = '';
		$scope.city_1_1 = '';
		$scope.pincode_1_1 = '';
		$scope.ifsc_1_1 = '';
		$scope.swift_1_1 = '';
		$scope.upiid_1_1 = '';
		$scope.canmobavialble = '0';
		$("#custmob_error").text('');
		$("#custname_error").text('');
		$("#custlandline_error").text('');
		$("#custcompname").val('');
		$("#custdob").val('');
		$("#custdob_error").text('');
		$("#custdoanniv").val('');
		$("#custanniv_error").text('');
		$("#custgstpanno").val('');
		$("#custgstpan_error").text('');
		$("#custemail_error").text('');
		$("#custaltemail_error").text('');
		$("#1_Msg_address_1").text('');
		$("#adrline2_1_1").val('');
		$("#adrline3_1_1").val('');
		$("#1_City_Msg_1").val('');
		$("#1_postcodeMsg_1").text('');
		$("#citynottext_1").text('');
		var value = $("#custaddressid").val();
		var arrayvalue = value.split(',');
		for(var i=0; i<arrayvalue.length;i++ )
		{ 
	     	if(arrayvalue[i] == 0)
	     	{
	         	arrayvalue.splice(i,1);  
	         	i--; 
	     	}
	    }
	    var lgth = arrayvalue.length;
		var status=[];
		for(var i=0;i<lgth;i++)
		{
			var divid = '#nextaddrdiv_'+arrayvalue[i];
  			$("#addmoreadr").find(divid).remove();
  			var values=$("#custaddressid").val();
  			var removevalue=values.replace(arrayvalue[i],'0');
			$("#custaddressid").val(removevalue);
		}
		var value1 = $("#cntbankdetails").val();
		var arrayvalue1 = value1.split(',');
		for(var a=0; a<arrayvalue1.length;a++ )
		{ 
	     	if(arrayvalue1[a] == 0)
	     	{
	         	arrayvalue1.splice(a,1);  
	         	a--; 
	     	}
	    }
	    var lgth = arrayvalue1.length;
		var status=[];
		for(var b=0;b<lgth;b++)
		{
			var divid = '#nextbankinfodiv_'+arrayvalue1[b];
  			$("#addmorebank").find(divid).remove();
  			var values1=$("#cntbankdetails").val();
  			var removevalue1=values1.replace(arrayvalue1[b],'0');
			$("#cntbankdetails").val(removevalue1);
		}
		$("#acname_1_1").val('');
		$("#1_Msg_acname_1").text('');
		$("#bankname_1_1").val('');
		$("#1_Msg_bankname_1").text('');
		$("#acno_1_1").val('');
		$("#1_Msg_bankacno_1").text('');
		$("#1_Msg_ifsc_1").text('');
		$("#ifscbranch_1_1").val('');
		$("#ifsccity_1_1").val('');
		$("#1_Msg_swift_1").text('');
		$("#1_Msg_upi_1").text('');
	}
	$scope.removeaddr=function(id,Whichoperation)
	{
  		if(Whichoperation == 1)
  		{
  			var divid = '#nextaddrdiv_'+id;
  			$("#addmoreadr").find(divid).remove();
  			var values=$("#custaddressid").val();
  			var removevalue=values.replace(id,'0');
			$("#custaddressid").val(removevalue);
		}
		else
		{	
			/*$("#nextaddrdiv_"+id).html('');
			var values=$("#addressModifyID").val();
			var removevalue=values.replace(id,'0');
			$("#addressModifyID").val(removevalue);*/
		}
  	}
  	var banklimit = 4;
  	$scope.addmorebankdetails = function(divName,IsAdd)
	{
		var bankval = $("#cntbankdetails").val();
		var res = bankval.split(",");
		var aa = removezeors(res,0);
		$("#cntbankdetails").val('');
		$("#cntbankdetails").val(aa);
		var valarray = $.map(aa, function(value, index) {
		    return [value];
		});

		var counter = Math.max.apply(Math, valarray);
		var banklength = valarray.length;
		
		if (banklength >= banklimit)  
		{
          alert("You have reached to add " + banklimit + " bank details");
    	}
    	else
    	{
    		if(IsAdd == 1)
			{
				counter++;
				var Whichoperationremove=1;	
				var IsAdd=1;
  			}
			else
			{
				var counter=counter;
				var Whichoperationremove=0;	
				var IsAdd=0;	
			}
			var newdiv = document.createElement('div');
			var div1=` <div id="nextbankinfodiv_`+counter+`" > 
						<div class="row" style="margin-right: 0px;margin-left: 1px;margin-bottom: 0px;">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="row">
										<div class="col-sm-11">
											<span style="font-weight: 700;"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Bank Information</span> 
										</div> 
										<div class="col-sm-1">
											<button name="btnlist" value="remove" id="`+counter+`" class="btn btn-xs  pull-right" ng-click="removebank(`+counter+`,`+Whichoperationremove+`);" title="Remove bank information">
												<span class="glyphicon glyphicon-trash "></span> 
											</button>
										</div> 
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group" style="margin-right: 0px;margin-left: 1px;">
							<div class="col-sm-1">
								<small><label>A/C holder name :</label></small>
							</div>
							<div class="col-sm-5">
								<input type="text" id="acname_1_`+counter+`" placeholder="Enter A/C holder name" class="form-control" onclick="custonclick('acname_1_`+counter+`','`+IsAdd+`_Msg_acname_`+counter+`');">
								<small id="`+IsAdd+`_Msg_acname_`+counter+`" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>Bank Name :</label></small>
							</div>
							<div class="col-sm-5">
								<input type="text" id="bankname_1_`+counter+`" placeholder="Enter bank name" class="form-control" onclick="custonclick('bankname_1_`+counter+`','`+IsAdd+`_Msg_bankname_`+counter+`');">
								<small id="`+IsAdd+`_Msg_bankname_`+counter+`" style="color:red;"></small>
							</div>
						</div>
						<div class="row form-group" style="margin-right: 0px;margin-left: 1px;">
							<div class="col-sm-1">
								<small><label>Account No :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="acno_1_`+counter+`" id="acno_1_`+counter+`" placeholder="Enter bank account number" class="form-control" onclick="custonclick('acno_1_`+counter+`','`+IsAdd+`_Msg_bankacno_`+counter+`');">
								<small id="`+IsAdd+`_Msg_bankacno_`+counter+`" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>IFSC Code :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="ifsc_1_`+counter+`" id="ifsc_1_`+counter+`" placeholder="Enter IFSC code" class="form-control" onclick="custonclick('ifsc_1_`+counter+`','`+IsAdd+`_Msg_ifsc_`+counter+`');" ng-model="ifsc_1_`+counter+`" ng-pattern="/^[A-Za-z]{4}\d{7}$/">
								<small id="`+IsAdd+`_Msg_ifsc_`+counter+`" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>IFSC Branch :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="ifscbranch_1_`+counter+`" id="ifscbranch_1_`+counter+`" placeholder="Enter IFSC branch" class="form-control">
							</div>
						</div>
						<div class="row form-group" style="margin-right: 0px;margin-left: 1px;">
							<div class="col-sm-1">
								<small><label>IFSC City:</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="ifsccity_1_`+counter+`" id="ifsccity_1_`+counter+`" placeholder="Enter IFSC city" class="form-control">
							</div>
							<div class="col-sm-1">
								<small><label>SWIFT Code :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" style="text-transform:uppercase" name="swift_1_`+counter+`" id="swift_1_`+counter+`" placeholder="Enter SWIFT code" class="form-control" onclick="custonclick('swift_1_`+counter+`','`+IsAdd+`_Msg_swift_`+counter+`');" ng-model="swift_1_`+counter+`" ng-pattern="/^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/">
								<small id="`+IsAdd+`_Msg_swift_`+counter+`" style="color:red;"></small>
							</div>
							<div class="col-sm-1">
								<small><label>UPI ID :</label></small>
							</div>
							<div class="col-sm-3">
								<input type="text" name="upiid_1_`+counter+`" id="upiid_1_`+counter+`" placeholder="Enter UPI ID" class="form-control" onclick="custonclick('upiid_1_`+counter+`','`+IsAdd+`_Msg_upi_`+counter+`');" ng-model="upiid_1_`+counter+`" ng-pattern="/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/">
								<small id="`+IsAdd+`_Msg_upi_`+counter+`" style="color:red;"></small>
							</div>
						</div>
					</div>`;
			newdiv.innerHTML =div1; 
			var value=$("#cntbankdetails").val();
			var newvalue=value+','+counter;
			$("#cntbankdetails").val(newvalue);
			el = document.getElementById(divName);
			angular.element(el).append( $compile(newdiv)($scope));
		}
	}
	$scope.removebank=function(id,Whichoperation)
	{
  		if(Whichoperation == 1)
  		{
  			var divid = '#nextbankinfodiv_'+id;
  			$("#addmorebank").find(divid).remove();
  			var values=$("#cntbankdetails").val();
  			var removevalue=values.replace(id,'0');
			$("#cntbankdetails").val(removevalue);
		}
		else
		{	}
  	}
  	$scope.getcitynames = function(id)
  	{
  		if($scope.states == '')
  		{

  		}else
  		{
  			$("#citytext_"+id).val('');
	  		var selcountry = document.getElementById('country_1_1');
	   		var selcountryid = selcountry[selcountry.selectedIndex].value;
	   		var selstate = document.getElementById('state_1_1');
	   		var selstateid = selstate[selstate.selectedIndex].value;
	   		var cityname = $("#city_1_1").val();
	   		$http({
				method:'POST',
				url:'customer/CustomerController/getcitydata',
				data:{countryid:selcountryid,stateid:selstateid,cityname:cityname}
			}).then(function(response){
				$("#searchcitylist_1").show();
				$scope.cities = response.data.cityinfo.currenttable;
				if($scope.cities.length <= 0)
				{
					$("#searchcitylist_"+id).hide();
					$("#citynottext_"+id).show();		
				}
				//console.log($scope.cities);
			});
  		}
  	}
  	$scope.createnewcity = function(citytextid,id)
  	{
  		var cityname = $("#"+citytextid).val();
		var country = $("#country_1_"+id).val();  		
		var stateid = $("#state_1_"+id).val(); 
		if(stateid == null)
		{
			stateid = '0';
		}

		var st = validatecity(cityname);
		if(st == 0)
		{
			if(cityname == '')
			{
				$("#citynottext_"+id).hide();
				$("#1_City_Msg_"+id).text('City name should not be blank.');
			}
			else{
				$("#citynottext_"+id).hide();
				$("#searchcitylist_"+id).hide();
				$("#1_City_Msg_"+id).text('Invalid city name.');
			}
		}else{		
			$http({
				method:'POST',
				url:'customer/CustomerController/savecitydata',
				data:{cityname:cityname,countryid:country,stateid:stateid}
			}).then(function(response){
				//console.log("status code:"+response.data.currenttable[0].ResultCode);
				if(response.data.currenttable[0].ResultCode == 100)
				{
					var cityid = response.data.currenttable[0].CityID;
					$("#citynottext_"+id).hide();
					$("#citytext_"+id).val(cityid);
					$("#1_City_Msg_"+id).css('color','green');
					$("#1_City_Msg_"+id).text("City created successfully.");
					$("#1_City_Msg_"+id).fadeIn().delay(4000).fadeOut();
				} else{
					$("#citynottext_"+id).hide();
					$("#1_City_Msg_"+id).css('color','red');
					$("#1_City_Msg_"+id).text("Error while creating city.");
					$("#1_City_Msg_"+id).fadeIn().delay(4000).fadeOut();
				}
			});
		}	
  	}
  	function validatecity(name)
  	{
  		if(name == '')
  		{
  			var status = 0;
  		}else if(name.match(/^[a-zA-Z]*$/))
  		{
  			var status = 1;
  		}else{
  			var status = 0;
  		}
  		return status;
  	}
  	$scope.getselectedcity = function(cityname,cityid,stateid,id,isadd)
  	{
  		var divid = '#citynottext_'+id;
  		$(divid).hide();
  		$scope.citygetname =cityname;
		if(isadd==0)
		{
			$("#editcity_1_"+id).val(cityname);
		}
		else
		{
			$("#city_1_"+id).val(cityname);
		}
		$("#searchcitylist_"+id).hide();
		$("#citytext_"+id).val(cityid);
  	}
  	$scope.changestate = function(id)
  	{
  		var selcountry = document.getElementById('country_1_'+id);
  		var selcountryid = selcountry[selcountry.selectedIndex].value;
  		$scope.states = '';
  		//console.log("selcountryid:"+selcountryid);
  		$http({
			method:'POST',
			url:'customer/CustomerController/getchangecountrystate',
			data:{countryid:selcountryid}
		}).then(function(response){
			if(response.data.stateinfo.currenttable.length > 0){
				$scope.states =	response.data.stateinfo.currenttable;
			}else{
				$("#stateerror_1_"+id).text('No state available');
				$scope.states = '';
			 	$("#city_1_"+id).val();
			 	$scope.cities = '';
			}
		});
  	}
  	$scope.searchcity = function(name,id,isadd)
	{
        if(name != undefined)
		{
    		$("#dropdownloader"+id).css({
	    		"z-index": '10001',
	            "background-color":'rgba(0, 0, 0, 0.5)',
	            "z-index": '999',
	            position: 'absolute',
	            top: '0',
	            width:'100%',
	            height: '660px',
	            display: 'none'
	        });
    		$("#dropdownloader"+id).show();
    		$("#dropdownloader"+id).html('<img src="assets/images/loader.GIF" alt="Wait" style="margin-left:40%;margin-top:20%;position:absolute;z-index:1000" />');
    		var listid="searchcitylist_"+id;
    		document.getElementById(listid).style.display ="inherit";
    		$("#searchcitylist_"+id).show();
    		$("#citytext_"+id).val('0');
    		if(isadd==0)
    		{
    			var stateID=$("#editstate_1_"+id).val();
    		}
    		else
    		{
    			var stateID=$("#state_1_"+id).val();
    		}
    		$http({
    			method: 'POST',
    			url: 'customer/CustomerController/getcityinfo',
    			headers: {'Content-Type': 'application/json'},
    			data: {stateID:stateID,cityname:name}
    		}).then(function (response)
    		{
    			$scope.AllCity = response.data;
    			//console.log($scope.AllCity);
    			if($scope.AllCity=="")
    			{
    				//$scope.AllCity.CityID=-1;
    				$("#citynottext_"+id).show();
    				$("#searchcitylist_"+id).hide();
    			}
    			else
    			{
    				$scope.AllCity.CityID=$scope.AllCity[0].CityID;
    			}
	    		$("#citytext_"+id).val($scope.AllCity.CityID);
	    		$("#dropdownloader"+id).hide();
	    		$("#dropdownloader"+id).html('');
    		});
    		$("#searchcitylist_"+id).css({
        		border:"1px solid black",
    		    height: "150px",
    		    'overflow-y': "scroll",
    		    width:"90%",
    		    position:"absolute",
    		    "z-index":1000,
    		    fontSize: "16px",
    		    padding: "5px",
    		    "background-color":"white"
    		});
		}
		else{
			
		}
	}
	$scope.getselectedcity = function(city_name,cityid,stateid,id,isadd)
	{
		$scope.citygetname =city_name;
		if(isadd==0)
		{
			$("#editcity_1_"+id).val(city_name);
		}
		else
		{
			$("#city_1_"+id).val(city_name);
		}
		$("#searchcitylist_"+id).hide();
		$("#citytext_"+id).val(cityid);
	}
	$scope.verifycustmobile = function()
	{
  		var custmobileno = $("#custmobileno").val();
  		$http({
			method:'POST',
			url:'customer/CustomerController/verifycustomermobilenumber',
			data:{mobile:custmobileno}
		}).then(function(response){
			//swal("Hello world!");
			//console.log(response);
			$scope.ExCustdata=response.data.currenttable[0];
			//console.log($scope.ExCustdata);
			$scope.CustName=$scope.ExCustdata.DisplayName;
			$scope.CustMobile=$scope.ExCustdata.Contactdetail;
			$scope.CustAddress=$scope.ExCustdata.Addressline1;
			$scope.CustCityName=$scope.ExCustdata.CityName;
			$scope.CustState=$scope.ExCustdata.State;
			$scope.CustCountry=$scope.ExCustdata.Country;
			if(response.data.currenttable[0].ResultMsg == '101')
			{
				$("#custmob_error").css('color','green');	
				$("#custmob_error").text('mobile number not available.');
			}else
			{
				$("#viewcustmobdetails").popover({title: "<table style='width:100%;'><tr><td>Customer Details</td><td style='text-align:right;font-size:20px;'><span id='closepop' onclick='hidepop();'>&times;</td></tr></table>", content: "<b>Name: </b>"+$scope.CustName+"<br> <b>Mobile No: </b>"+$scope.CustMobile+"<br> <b>Address: </b>"+$scope.CustAddress+"<br> <b>City: </b>"+$scope.CustCityName+"<br> <b>State: </b>"+$scope.CustState+"<br> <b>Country: </b>"+$scope.CustCountry+"", html: true, placement: "right",container: "body"});
				$("#custmob_error").css('color','red')
				$scope.canmobavialble = '0';
				$("#custmob_error").text('mobile number available.');
				$("#viewcustmobdetails").show();
			}
			/*if(custdata != null)
			{
				var cumobdata = response.data.currenttable;	
			}
			else
			{
				var cumobdata = '';
			}*/
			//$scope.customermobexistdata = cumobdata;
			//console.log($scope.states);
		});
	}
	$scope.mobilevalidation = function()
	{
		$("#viewcustmobdetails").hide();
		$("#custmobavaible").val('0');
		var mobilenumber = $("#custmobileno").val();
		var letters = /^[+,0-9]{10,15}$/;
		var status = '';
		if(mobilenumber == '' || mobilenumber==undefined)
		{
			status = 0;
		}
		else
		{
			var n = mobilenumber.indexOf("+");
			var count = 0;
			for(var i=0; mobilenumber.length > i; i++)
			{
				if(mobilenumber.charAt(i) == '+')
				{
				    ++count; 
				}
			} 
			if(!mobilenumber.match(letters))
			{
				document.getElementById("custmob_error").innerHTML="Invalid mobile number.";
				status=0;
			} 
			else if(count == 0)
			{
				document.getElementById("custmob_error").innerHTML="";
				status=1;
			}
			else if(n != 0)
	   		{
	    		document.getElementById("custmob_error").innerHTML="+ position should be first.";
	    		status=0;
	    	}
	    	else if(count > 1)
	    	{
				document.getElementById("custmob_error").innerHTML="Multiple + are not allowed.";
				status=0;
			}
			else{
				status=1;
				document.getElementById("custmob_error").innerHTML="";
			}
		}
		if(status == 1)
		{
			$scope.canmobavialble = 1;
		}
	}
	$scope.editcustomer = function(accountid,branchid)
	{

	}

	$scope.createcustomer = function()
	{
		var custmobileno = $("#custmobileno").val();
		var custmobilepresent = $("#custmobavaible").val();
		var groupname = $("#custgroupname").val();
		var customername = $("#custname").val();
		var custlandlinename = $("#custlandno").val();
		var custcompname = $("#custcompname").val();
		var custdob = $("#custdob").val();
		var custdoanniversary = $("#custdoanniv").val();
		var custdoanniversary = $("#custdoanniv").val();
		var custgstpannumber = $("#custgstpanno").val();
		var custemailid = $("#custemail").val();
		var custaltemail = $("#custaltemail").val();
		/* other details  */
		$scope.otherdetails=[];
		$scope.otherdetails.push({
			"customermobileNo" :custmobileno,
			"Iscustmobavailable":custmobilepresent,
			"groupname":groupname,
			"customername" : customername,
			"custlandlinename" : custlandlinename,
			"custcompname":custcompname,
			"custdob":custdob,
			"custdoanniversary":custdoanniversary,
			"custgstpannumber":custgstpannumber,
			"custemailid":custemailid,
			"custaltemail":custaltemail
		});

		/* End of Other details  */

		/* Address information */
		$scope.address=[];
		var addrvalue=$("#custaddressid").val();
		var addrid = addrvalue.split(',');
		for(var i=0; i<addrid.length;i++ )
		{ 
		    if(addrid[i] == 0)
		    {
		        addrid.splice(i,1);  
		        i--; 
		    }
		} 
		var totaladdr = addrid.length;
		//console.log("total addr:"+totaladdr);
		for(var x=0;x<totaladdr;x++)
		{
			console.log(addrid[x]);
			var address_1 = $("#adrline1_1_"+addrid[x]).val().trim();
			var address_2 = $("#adrline2_1_"+addrid[x]).val().trim();
			var address_3 = $("#adrline3_1_"+addrid[x]).val().trim();
			var country = $("#country_1_"+addrid[x]).val();
			var country_1 = country.replace('string:','');
			var state_1 = $("#state_1_"+addrid[x]).val();
			//console.log("state:"+state);
			//var state_1 = state.replace('string:','');
			var city_1= $("#citytext_"+addrid[x]).val();
			var pincode_1 = $("#pincode_1_"+addrid[x]).val().trim();
			$scope.address.push({
				"address_1" :address_1,
		        "address_2" :address_2,
		        "address_3" :address_3,
		       	"country_1":country_1,
		       	"state_1":state_1,
		       	"cityid":city_1,
		        "postcode_1":pincode_1
			});
		}
		/* End of Address */

		/* Bank information */
		$scope.bankdetails=[];
		var bankvalue=$("#cntbankdetails").val();
		var bankid = bankvalue.split(',');
		for(var a=0; a<bankid.length;a++ )
		{ 
		    if(bankid[a] == 0)
		    {
		        bankid.splice(a,1);  
		        a--; 
		    }
		} 
		var totalbank = bankid.length;
		//console.log("total bank:"+totalbank);
		for(var b=0;b<totalbank;b++)
		{
			var accountname_1 = $("#acname_1_"+bankid[b]).val().trim();
			var bankname_1 = $("#bankname_1_"+bankid[b]).val().trim();
			var accountno_1 = $("#acno_1_"+bankid[b]).val().trim();
			var ifsccode_1 = $("#ifsc_1_"+bankid[b]).val().trim();
			var ifscbranch_1 = $("#ifscbranch_1_"+bankid[b]).val().trim();
			var ifsccity_1 = $("#ifsccity_1_"+bankid[b]).val().trim();
			var swiftcode_1 = $("#swift_1_"+bankid[b]).val().trim();
			var upiid_1 = $("#upiid_1_"+bankid[b]).val().trim();
			
			$scope.bankdetails.push({
				"accountname_1" :accountname_1,
		        "bankname_1" :bankname_1,
		        "accountno_1" :accountno_1,
		       	"ifsccode_1":ifsccode_1,
		       	"ifscbranch_1":ifscbranch_1,
		       	"ifsccity_1":ifsccity_1,
		        "swiftcode_1":swiftcode_1,
		        "upiid_1":upiid_1
			});
		}
		/* End of Bank */
		var whichCheckboxischecked=$("#checkedprimaryaddr").val();
		if(whichCheckboxischecked=='')
		{
			var IsPrimaryAddressID=0;	
		}else{
			var IsPrimaryAddressID=whichCheckboxischecked;
		}
		var otherdtstatus = customerotherdetailsvalidation($scope.otherdetails);
		//console.log("otherdtstatus:"+otherdtstatus);
		var custaddrstatus = customeraddressvalidation($scope.address);
		//console.log("custaddrstatus:"+custaddrstatus);
		var custbankdtstatus = customerbankdetailvalidation($scope.bankdetails);
		//console.log("custbankdtstatus:"+custbankdtstatus);
	}
	function customerotherdetailsvalidation($otherdata)
	{
		var namepattern=/^[a-zA-Z ]*$/;
		var emailpatteren=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
		var mobilenopattern = /^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$/;
		var landlinenopattern = /^\(0\d{1,2}\)\d{3}-\d{4}$/;
		var gstinpattern = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/;
		var pancardpatter = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
		var status = ''; var status1 = ''; var status2 = ''; var status3 = '';
		var status4 = ''; var status4a = ''; var status4b = ''; var status4c = ''; 
		var status4d = ''; var status5 = ''; var status6 = ''; var status7 = '';
		var pangst = $otherdata[0].custgstpannumber;
		var pangstlen = pangst.length;
		//console.log("pangstlen:"+pangstlen);
		if($otherdata[0].customermobileNo == '')
		{
			document.getElementById("custmob_error").innerHTML="Mobile number should not be blank.";
			status1=0;
			document.getElementById("custmobileno").style.border = "1px solid red";
		}else
		{	
			if($otherdata[0].customermobileNo.match(mobilenopattern)){
				document.getElementById("custmob_error").innerHTML="";	
				status1=1;
				document.getElementById("custmobileno").style.border = "1px solid green";
			}
			else{

				document.getElementById("custmob_error").innerHTML="Invalid mobile number.";	
				status1=0;
				document.getElementById("custmobileno").style.border = "1px solid red";
			}
		}
		if($otherdata[0].customername=='')
		{
			document.getElementById("custname_error").innerHTML="Name should not be blank.";
			status2 = 0;
			document.getElementById("custname").style.border = "1px solid red";
		}else
		{
			if($otherdata[0].customername.match(namepattern)){
				document.getElementById("custname_error").innerHTML="";	
				status2 = 1;
				document.getElementById("custname").style.border = "1px solid green";	
			}
			else{
				document.getElementById("custname_error").innerHTML="Invalid name.";	
				status2 = 0;
				document.getElementById("custname").style.border = "1px solid red";
			}
		}
		if($otherdata[0].custlandlinename == '')	
		{
			document.getElementById("custlandline_error").innerHTML="";	
			status3=1;	
		}
		else
		{
			if($otherdata[0].custlandlinename.match(landlinenopattern))
			{
				document.getElementById("custlandline_error").innerHTML="";	
				status3 = 1;
				document.getElementById("custlandno").style.border = "1px solid green";
			}
			else{
				document.getElementById("custlandline_error").innerHTML="Invalid landline number.";	
				status3=0;
				document.getElementById("custlandno").style.border = "1px solid red";
			}	
		}
		if($otherdata[0].custdob=='')
		{
			status4 = 1;
			document.getElementById("custdob_error").innerHTML="";
		}
		else
		{
			var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
			var DOBdate=$("#custdob").val();
			if($otherdata[0].custdob.match(pattern))
			{
				var custdob=DOBdate;
				var weddate= $otherdata[0].custdoanniversary;
			}
			else
			{
				var DOB= $otherdata[0].custdob;
				var res = DOB.split("-");
				var year = res[2];
				var month =  res[1];
				switch (res[1]) 
				{
					case 'Jan':
						month = '01';
						break;
					case 'Feb':
						month = '02';
						break;
					case 'Mar':
						month = '03';
						break;
					case 'Apr':
						month = '04';
						break;
					case 'May':
						month = '05';
						break;
					case 'Jun':
						month = '06';
						break;
					case 'Jul':
						month = '07'; 
						break;
					case 'Aug':
						month = '08';
						break;
					case 'Sep':
						month = '09';
						break;
					case 'Oct':
						month = '10';
						break;
					case 'Nov':
						month = '11';
						break;
					case 'Dec':
						month = '12';
						break;
				}
				var day = res[0];
				var DOB=   day+'-'+ month + '-' +  year;
				var wdate= $otherdata[0].custdoanniversary;
				var res = wdate.split("-");
				var year = res[2];
				var month =  res[1];
				switch (res[1]) 
				{
					case 'Jan':
						month = '01';
						break;
					case 'Feb':
						month = '02';
						break;
					case 'Mar':
						month = '03';
						break;
					case 'Apr':
						month = '04';
						break;
					case 'May':
						month = '05';
						break;
					case 'Jun':
						month = '06';
						break;
					case 'Jul':
						month = '07'; 
						break;
					case 'Aug':
						month = '08';
						break;
					case 'Sep':
						month = '09';
						break;
					case 'Oct':
						month = '10';
						break;
					case 'Nov':
						month = '11';
						break;
					case 'Dec':
						month = '12';
						break;
				}
				var day = res[0];
				var weddate=   day+'-'+ month + '-' +  year;	
			}
			if(DOB.match(pattern))
			{
				var todaysdate = gettodaysdate();
				var dif = datediff(DOB,todaysdate);
				if(dif>=0)
				{
					var str =DOB;
					var res = str.split("-");
					if((res[0] < 1 || res[0] > 31)) 
					{
						status4a = 0;
					}else{
						status4a = 1;
						document.getElementById("custdob_error").innerHTML="";
					}
					if(res[1] < 1 || res[1] > 12)
					{
						status4b = 0;
					}else{
						status4b = 1;
						document.getElementById("custdob_error").innerHTML="";
					}
					if(res[2] < 1902 || res[2] > (new Date()).getFullYear())
					{
						status4c = 0;
					}else{
						status4c = 1;
							document.getElementById("custdob_error").innerHTML="";
					}
					if(res[1]== '02' )
					{								
						var leapYear = false;
		                if ((!(res[2] % 4) && res[2] % 100) || !(res[2] % 400))
						{
		                    leapYear = true;
						}
		                if ((leapYear == false) && (res[0] >= 29)) {
		                    status4d = 0;
		                }
		                else if ((leapYear == true) && (res[0] > 29)) 
		                {
		                   status4d = 0;
						}
						else
						{
							status4d = 1;
						}
					}
					else
					{
						document.getElementById("custdob_error").innerHTML="";
						status4d = 1;	
					}
						
					if(status4a==1 && status4b==1 && status4c==1 && status4d==1)
					{
						document.getElementById("custdob_error").innerHTML="";	
						if($otherdata[0].custdoanniversary=='')
						{
							status4 = 1;
							document.getElementById("custanniv_error").innerHTML="";
						}
						else
						{
							if(weddate.match(pattern))
							{
								var Wed=weddate;
							}
							else
							{
								var Wed=convertdate($otherdata[0].weddingDate);
							}
							if(DOB.match(pattern))
							{
								var DOB=DOB;
							}
							else
							{
								var DOB=convertdate($otherdata[0].DOB);
							}				
							var diff=datediff(DOB,Wed);
							if(diff>=1)
							{
								status4 = 1;	
								document.getElementById("custanniv_error").innerHTML="";
							}
							else
							{
								status4 = 0;		
								document.getElementById("custanniv_error").innerHTML="Invalid Date Selection";
								document.getElementById("custdoanniv").style.border = "1px solid red";	
							}
						}
					}
					else
					{
						if(leapYear==true)
						{
							document.getElementById("Msg_dateOfBirth").innerHTML="Date is not in proper format(leap year).";
							document.getElementById("custdob").style.border = "1px solid red";	
						}
						else if(leapYear==false  && month==2)
						{
							document.getElementById("Msg_dateOfBirth").innerHTML="Date is not in proper format(not leap year).";
							document.getElementById("custdob").style.border = "1px solid red";	
						}	
						else
						{
							document.getElementById("Msg_dateOfBirth").innerHTML="Date is not in proper format.";
							document.getElementById("custdob").style.border = "1px solid red";	
						}
						var status9=false;		
					}
				}
				else
				{
					document.getElementById("custdob_error").innerHTML="Date should not be greater than today's date.";	
					document.getElementById("custdob").style.border = "1px solid red";	
					status4 = 0;	
				}
			}
			else
			{	
				document.getElementById("custdob_error").innerHTML="Date is not in DD-MM-yyyy format.";	
				document.getElementById("custdob").style.border = "1px solid red";	
				status4 = 0;	
			} 
		}
		if($otherdata[0].custemailid =='')
		{
			document.getElementById("custemail_error").innerHTML="";
			status5 = 0;
		}else
		{
			if($otherdata[0].custemailid.match(emailpatteren))
			{
				document.getElementById("custemail_error").innerHTML="";	
				status5 = 1;
				document.getElementById("custemail").style.border = "1px solid green";	
			}
			else{
				document.getElementById("custemail_error").innerHTML="Invalid email address";	
				document.getElementById("custemail").style.border = "1px solid red";	
				status5 = 0;
			}
		}
		if($otherdata[0].custaltemail =='')
		{
			document.getElementById("custaltemail_error").innerHTML="";
			status6 = 0;
		}else
		{
			if($otherdata[0].custaltemail.match(emailpatteren))
			{
				document.getElementById("custaltemail_error").innerHTML="";	
				status6 = 1;
				document.getElementById("custaltemail").style.border = "1px solid green";
			}
			else{
				document.getElementById("custaltemail_error").innerHTML="Invalid email address";	
				status6 = 0;
				document.getElementById("custaltemail").style.border = "1px solid red";
			}
		}
		if(pangstlen == 10)
		{ //PAN CARD
			if($otherdata[0].custgstpannumber =='')
			{
				document.getElementById("custgstpan_error").innerHTML="";
				status7 = 1;
			}
			else
			{
				if($otherdata[0].custgstpannumber.match(pancardpatter))
				{
					document.getElementById("custgstpan_error").innerHTML="";	
					status7 = 1;
				}
				else{
					document.getElementById("custgstpan_error").innerHTML="Invalid PAN card details";	
					status7 = 0;
					document.getElementById("custgstpanno").style.border = "1px solid red";
				}
			}

		}else{
			if($otherdata[0].custgstpannumber =='')
			{
				document.getElementById("custgstpan_error").innerHTML="";
				status7 = 1;
				document.getElementById("custgstpanno").style.border = "1px solid #ccc";
			}
			else
			{
				if($otherdata[0].custgstpannumber.match(gstinpattern))
				{
					document.getElementById("custgstpan_error").innerHTML="";	
					status7 = 1;
					document.getElementById("custgstpanno").style.border = "1px solid #ccc";
				}
				else{
					document.getElementById("custgstpan_error").innerHTML="Invalid GST details";	
					status7 = 0;
					document.getElementById("custgstpanno").style.border = "1px solid red";
				}
			}
		}
		if((status1 ==1)&&(status2 ==1)&&(status3 ==1)&&(status4 ==1)&&(status5 ==1)&&(status6 ==1)&&(status7 ==1))
		{
			status = 1;
		}else{
			status = 0;
		}
		return status;
	}
	function customeraddressvalidation($address)
	{
		var value = $("#custaddressid").val();
		var arrayvalue = value.split(',');
		for(var i=0; i<arrayvalue.length;i++ )
		{ 
	     	if(arrayvalue[i] == 0)
	     	{
	         	arrayvalue.splice(i,1);  
	         	i--; 
	     	}
	    }
	    var lgth = arrayvalue.length;
		var status=[];
		for(var i=0;i<lgth;i++)
		{
			if($address[i].address_1=='')
			{
				document.getElementById("1_Msg_address_"+arrayvalue[i]).innerHTML="Address line 1 should not be blank.";
				var status1 = 0;
				document.getElementById("adrline1_1_"+arrayvalue[i]).style.border = "1px solid red";
			}
			else
			{
				var status1 = 1;	
				document.getElementById("1_Msg_address_"+arrayvalue[i]).innerHTML='';	
			}
			if($address[i].cityid == 0 || $address[i].cityid == '')
			{
				document.getElementById("1_City_Msg_"+arrayvalue[i]).innerHTML="Enter city name.";
				var status2 = 0;
				document.getElementById("city_1_"+arrayvalue[i]).style.border = "1px solid red";
			}
			else
			{
				var status2 = 1;	
			}
			if($address[i].postcode_1=='')
			{
				document.getElementById("1_postcodeMsg_"+arrayvalue[i]).innerHTML="";
				var status3 = 1;
			}
			else
			{
				if($address[i].postcode_1.match(/^[0-9]{5,11}$/))
				{
					document.getElementById("1_postcodeMsg_"+arrayvalue[i]).innerHTML="";
					var status3 = 1;
				}
				else 
				{
					document.getElementById("1_postcodeMsg_"+arrayvalue[i]).innerHTML="Invalid postal code number";
					var status3 = 0;
					document.getElementById("pincode_1_"+arrayvalue[i]).style.border = "1px solid red";
				}
			}
			
			if((status1 == 1)&&(status2 == 1)&&(status3 == 1))
			{
				status.push(1);
			}else{
				status.push(0);
			}
		}
		//console.log("status:"+status);
		if(jQuery.inArray(0, status) !== -1){
			return 0;
		}else{
			return 1;
		}
	}
	function customerbankdetailvalidation($bank)
	{
		var acholdernamepattern = /^[a-zA-Z\s]*$/; 
		var bankacnopattern = /^(?:[0-9]{11}|[0-9]{2}-[0-9]{3}-[0-9]{6})$/; 
		var ifscpattern = /^[A-Za-z]{4}\d{7}$/;
		var swiftcode = /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/;
		var upiidpattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; 
		var value = $("#cntbankdetails").val();
		var arrayvalue = value.split(',');
		for(var i=0; i<arrayvalue.length;i++ )
		{ 
	     	if(arrayvalue[i] == 0)
	     	{
	         	arrayvalue.splice(i,1);  
	         	i--; 
	     	}
	    }
	    var lgth = arrayvalue.length;
		var status=[];
		for(var i=0;i<lgth;i++)
		{
			if($bank[i].accountno_1 !='')
			{
				if($bank[i].bankname_1=='')
				{
					document.getElementById("1_Msg_bankname_"+arrayvalue[i]).innerHTML="Bank name should not be blank.";
					var status1 = 0;
					document.getElementById("bankname_1_"+arrayvalue[i]).style.border = "1px solid red";
				}
				else
				{
					var status1 = 1;	
					document.getElementById("1_Msg_bankname_"+arrayvalue[i]).innerHTML='';	
				}
				if($bank[i].accountno_1.match(bankacnopattern))
				{
					document.getElementById("1_Msg_bankacno_"+arrayvalue[i]).innerHTML="";	
					var status2 = 1;
				}
				else{
					var status2 = 0;	
					document.getElementById("1_Msg_bankacno_"+arrayvalue[i]).innerHTML='Invalid bank account number.';		
					document.getElementById("acno_1_"+arrayvalue[i]).style.border = "1px solid red";
				}
				if($bank[i].accountname_1 == '')
				{
					document.getElementById("1_Msg_acname_"+arrayvalue[i]).innerHTML="Enter account holder name.";
					var status3 = 0;
					document.getElementById("acname_1_"+arrayvalue[i]).style.border = "1px solid red";
				}
				else
				{
					if($bank[i].accountname_1.match(acholdernamepattern))
					{
						document.getElementById("1_Msg_acname_"+arrayvalue[i]).innerHTML="";	
						var status3 = 1;
					}
					else{
						document.getElementById("1_Msg_acname_"+arrayvalue[i]).innerHTML="Invalid account holder name.";	
						var status3 = 0;
						document.getElementById("acname_1_"+arrayvalue[i]).style.border = "1px solid red";
					}
				}
			}else{
				var status1 = 1;	
				document.getElementById("1_Msg_bankname_"+arrayvalue[i]).innerHTML='';	
				document.getElementById("bankname_1_"+arrayvalue[i]).style.border = "1px solid #ccc";
				document.getElementById("1_Msg_bankacno_"+arrayvalue[i]).innerHTML="";	
				var status2 = 1;
				document.getElementById("acno_1_"+arrayvalue[i]).style.border = "1px solid #ccc";
				document.getElementById("1_Msg_acname_"+arrayvalue[i]).innerHTML="";	
				var status3 = 1;
				document.getElementById("acname_1_"+arrayvalue[i]).style.border = "1px solid #ccc";
			}
			if($bank[i].ifsccode_1=='')
			{
				document.getElementById("1_Msg_ifsc_"+arrayvalue[i]).innerHTML="";
				var status4 = 1;
			}
			else
			{
				if($bank[i].ifsccode_1.match(ifscpattern))
				{
					document.getElementById("1_Msg_ifsc_"+arrayvalue[i]).innerHTML="";	
					var status4 = 1;
				}
				else{
					var status4 = 0;	
					document.getElementById("1_Msg_ifsc_"+arrayvalue[i]).innerHTML='Invalid IFSC code.';		
					document.getElementById("ifsc_1_"+arrayvalue[i]).style.border = "1px solid red";
				}	
			}
			if($bank[i].swiftcode_1=='')
			{
				document.getElementById("1_Msg_swift_"+arrayvalue[i]).innerHTML="";
				var status5 = 1;
			}
			else
			{
				if($bank[i].swiftcode_1.match(swiftcode))
				{
					document.getElementById("1_Msg_swift_"+arrayvalue[i]).innerHTML="";	
					var status5 = 1;
				}
				else{
					var status5 = 0;	
					document.getElementById("1_Msg_swift_"+arrayvalue[i]).innerHTML='Invalid IFSC code.';		
					document.getElementById("swift_1_"+arrayvalue[i]).style.border = "1px solid red";
				}
			}
			if($bank[i].upiid_1=='')
			{
				document.getElementById("1_Msg_upi_"+arrayvalue[i]).innerHTML="";
				var status6 = 1;
			}
			else
			{
				if($bank[i].upiid_1.match(upiidpattern))
				{
					document.getElementById("1_Msg_upi_"+arrayvalue[i]).innerHTML="";	
					var status6 = 1;
				}
				else{
					var status6 = 0;	
					document.getElementById("1_Msg_upi_"+arrayvalue[i]).innerHTML='Invalid UPI ID.';		
					document.getElementById("upiid_1_"+arrayvalue[i]).style.border = "1px solid red";
				}
			}
			if((status1 == 1)&&(status2 == 1)&&(status3 == 1)&&(status4 == 1)&&(status5 == 1))
			{
				status.push(1);
			}else{
				status.push(0);
			}
		}
		//console.log("status:"+status);
		if(jQuery.inArray(0, status) !== -1){
			return 0;
		}else{
			return 1;
		}
	}
  	
  	
	
});
function hidepop()
{
	$("#viewcustmobdetails").popover('hide');
}
function loadstate(id,isadd,isload)
{
	if(isload==0)
	{
		var ContID=91;
	}
	else
	{
		if(isadd==0)
		{
			var ContID=$("#editcountry_1_"+id).val();
		}else
		{
			var ContID=$("#country_1_"+id).val();
		}
	}
	if(ContID==undefined)
	{
		ContID=1;
	}
	else
	{
		ContID=ContID;
	}
	
	$.ajax({
		async: true,
		method:'POST',			
		url:'customer/CustomerController/getstateinfo',
		data: {CountryID:ContID},
		success:function(res)
		{	
			//console.log(res);
			if(isadd==0)
			{
				$("#editstate_1_"+id).empty();
				var states=JSON.parse(res);
				$("#editstate_1_"+id).append(states);
			}
			else
			{
				$("#state_1_"+id).empty();
				var states=JSON.parse(res);
				$("#state_1_"+id).append(states);
			}
		}
	});	
}
function hidecityvalue1(name,id)
{
	var text=name+id;
	$("#"+text).val('');
	$("#searchcitylist_"+id).hide();
	$("#citynottext_"+id).hide();
	$("#city_1_"+id).val('');
	$("#citytext_"+id).val('0');
}
function hidecityvalueaddmore(id,cno)
{	
	var name = $("#"+id).attr("name");
	var res = name.replace("NaN",cno);
	$("#"+res).val('');
	$("#citynottext_"+id).hide();
	$("#city_1_"+id).val('');
	$("#citytext_"+id).val('0');
}
function countrychange(id)
{
	$("#citynottext_"+id).hide();
	$("#city_1_"+id).val('');
	$("#citytext_"+id).val('0');
}
function selectIsPrimaryData(id)
{	
	var IsPrimary = document.getElementsByName("Isprimarydata");
  	Array.prototype.forEach.call(IsPrimary,function(el){
    	el.checked = 0;
  	});
  	id.checked = 1;
}
function selectOnlyThis(id,a)
{	
	var myCheckbox = document.getElementsByName("myCheckbox");
  	Array.prototype.forEach.call(myCheckbox,function(el)
  	{
    	el.checked = 0;
  	});
  	id.checked = 1;
	$("#checkedprimaryaddr").val(a);
}
function customersearch()
{	
	var searchdata=$("#customer_search").val();
	$.ajax({
		type: "POST",
		url:"customer/CustomerController/searchbycustomer",
		data:{searchkey:searchdata},
		cache: false,
		success: function(html)
		{
			console.log("data:"+html);
			$("#customersearchresult").html(html).show();
		}
	});
}
$('#customer_search').click(function(){
    $("#customersearchresult").fadeIn();
});
$(document).on("click", function(e) { 
    var $clicked = $(e.target);
    if (! $clicked.hasClass("search_keyword")){
        $("#customersearchresult").fadeOut(); 
        $("#customersearchresult").val('');    
    }
});
$(document).on("click", function(e) { 
    var $clicked = $(e.target);
    if (! $clicked.hasClass("citysearch")){
        $("#searchcitylist_1").fadeOut();    
    }
});