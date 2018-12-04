app.controller('enquirycreation',function($scope,$http,$compile,$rootScope){
	getenquirydetails(1);

	function getenquirydetails(Page)
	{
		$("#masterloader").show();
		$("#masterloader").html('<img src="assets/images/loader1.gif" alt="Wait" style="left:40%;top:30%;position:absolute;z-index:9999;height:150px;width:150px;" />');
		$http({
			method:'POST',
			url:'enquiry/MY_Enquiryactioncontroller/getcustenquiryinformation',
			data:{page:Page}
		}).then(function(response){
			// console.log(response);
			
			getcustenquiryotherdata();
			$("#masterloader").hide();
			$("#masterloader").html('');
		});
	}
	function getcustenquiryotherdata()
	{
		$http({
			method:'POST',
			url:'enquiry/MY_Enquiryactioncontroller/getcustenquiryotherinformation'
		}).then(function(response){
			console.log(response);
			$scope.enqsrcname = response.data.enqsrcinfo.currenttable;
			$scope.enqgroupname = response.data.enqgrpinfo.currenttable;
			$scope.enqproductname = response.data.enqproduct.currenttable;
			$scope.productcountlen = $scope.enqproductname.length;
			$scope.enqrequirements = response.data.enqrequirements.currenttable;
			$scope.reqcountlen = $scope.enqrequirements.length;
			$scope.salesman = response.data.salesman.currenttable;
			
			$("#masterloader").hide();
			$("#masterloader").html('');
		});
	}
	var expanded = false;
	$scope.showproductnames=function() 
	{	
		var checkboxes = document.getElementById("productbox");
		if (!expanded) {	
		$('#productcaret').removeClass('caret').addClass('fa fa-caret-up');		
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			$('#productcaret').removeClass('fa fa-caret-up').addClass('caret');
			checkboxes.style.display = "none";
			expanded = false;
		}
	}
	$scope.getenquiryproductid = function(id)
	{
		var idd='pro_'+id;
		var isChecked = $('#'+idd).is(":checked");	
		if(isChecked)
		{
			var $checkboxes = $('#dynamicproid input[type="checkbox"]');
			var countCheckedCheckboxes = $checkboxes.filter(':checked').length;
			
			document.getElementById("productcount").innerHTML=" product selected";
			document.getElementById(idd).checked = true;
			var count =$('#productcommgrouppopover ul input[type="checkbox"]:checked').length;
			var totalCheckboxes =  $scope.productcountlen;
			if(count==totalCheckboxes)
			{
				document.getElementById("allproductchkall").checked = true;	
			}else{
				document.getElementById("allproductchkall").checked = false;
			}
		}
		else
		{
			document.getElementById(idd).checked = false;
			document.getElementById("allproductchkall").checked = false;
			var count =$('#productcommgrouppopover ul input[type="checkbox"]:checked').length;
			if(count ==0)
			{
				document.getElementById("productcount").innerHTML="Select Product";
			}
			else{
				document.getElementById("productcount").innerHTML=" Product selected";
			}
		}
	}
	$scope.selectallproduct = function()
	{
		var count=0;
		var x=$("#allproductchkall").is(':checked');
		if (x == true) {
			$(".chk").prop("checked", true);
			var count = $("[type='checkbox']:checked").length;
			var myconut = $('input[class=chk]').attr('checked', true).length;
			var newcount = myconut - 1;
			document.getElementById("productcount").innerHTML=" Product selected";
		} else {
			document.getElementById("productcount").innerHTML="Select Product";
			$(".chk").prop("checked", false);
		}
	}
	$scope.removeproductsearch = function()
	{
		$scope.searchproname = '';
	}
	var reqexpanded = false;
	$scope.showrequirementnames = function()
	{
		var checkboxes = document.getElementById("requirementbox");
		if (!reqexpanded) {	
			$('#reqcaret').removeClass('caret').addClass('fa fa-caret-up');
			checkboxes.style.display = "block";
			reqexpanded = true;
		} else {
			$('#reqcaret').removeClass('fa fa-caret-up').addClass('caret');
			checkboxes.style.display = "none";
			reqexpanded = false;
		}
	}
	$scope.removerequiremsearch = function()
	{
		$scope.searchrequirename = '';
	}
	$scope.selectallrequirements = function()
	{
		var count=0;
		var x=$("#allrequirementchkall").is(':checked');
		if (x == true) {
			$(".chkrequirement").prop("checked", true);
			var count = $("[type='checkbox']:checked").length;
			var myconut = $('input[class=chkrequirement]').attr('checked', true).length;
			var newcount = myconut - 1;
			document.getElementById("requirementcount").innerHTML=" Requirement selected";
		} else {
			document.getElementById("requirementcount").innerHTML="Select Requirement";
			$(".chkrequirement").prop("checked", false);
		}
	}
	$scope.getenquiryrequirementid = function(id)
	{
		var idd='req_'+id;
		var isChecked = $('#'+idd).is(":checked");	
		if(isChecked)
		{
			var $checkboxes = $('#dynamicrequirememntid input[type="checkbox"]');
			var countCheckedCheckboxes = $checkboxes.filter(':checked').length;
			
			document.getElementById("requirementcount").innerHTML=" Requirement selected";
			document.getElementById(idd).checked = true;
			var count =$('#requirgrouppopover ul input[type="checkbox"]:checked').length;
			var totalCheckboxes =  $scope.reqcountlen;
			if(count==totalCheckboxes)
			{
				document.getElementById("allrequirementchkall").checked = true;	
			}else{
				document.getElementById("allrequirementchkall").checked = false;
			}
		}
		else
		{
			document.getElementById(idd).checked = false;
			document.getElementById("allrequirementchkall").checked = false;
			var count =$('#requirgrouppopover ul input[type="checkbox"]:checked').length;
			if(count ==0)
			{
				document.getElementById("requirementcount").innerHTML="Select Requirement";
			}
			else{
				document.getElementById("requirementcount").innerHTML=" Requirement selected";
			}
		}
	}
	$scope.searchenqcustomer = function()
	{
		var custname = $("#encustname").val();
		console.log("custname:"+custname);
		if(custname != '')
		{
    		$("#custenqdropdownloader").css({
	    		"z-index": '10001',
	            "background-color":'rgba(0, 0, 0, 0.5)',
	            "z-index": '999',
	            position: 'absolute',
	            top: '0',
	            width:'100%',
	            height: '660px',
	            display: 'none'
	        });
    		$("#custenqdropdownloader").show();
    		$("#custenqdropdownloader").html('<img src="assets/images/loader.GIF" alt="Wait" style="margin-left:40%;margin-top:20%;position:absolute;z-index:1000" />');
    		document.getElementById("searchenqcustomerdiv").style.display ="inherit";
    		$("#searchenqcustomerdiv").show();
    		$("#enqcustid").val('0');
    		
    		$http({
    			method: 'POST',
    			url: 'enquiry/MY_Enquiryactioncontroller/getcustenqinformation',
    			headers: {'Content-Type': 'application/json'},
    			data: {custname:custname}
    		}).then(function (response)
    		{
    			$scope.enqcustomerinfo = response.data.enqcustinfo.currenttable;

	    		$("#custenqdropdownloader").hide();
	    		$("#custenqdropdownloader").html('');
    		});
    		$("#searchenqcustomerdiv").css({
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
			$scope.enqcustomerinfo = '';
			$("#searchenqcustomerdiv").hide();
		}
	}
	$scope.getselectedenqcustomer = function(disname,cusid)
	{
		$("#encustname").val(disname);
		$("#enqcustid").val(cusid);
		$("#searchenqcustomerdiv").hide();
	}
	$scope.saveenquiry = function()
	{
		var selectedproduct = [];
		$('#dynamicproid input:checked').each(function() {
			var proid = ($(this).attr('id'));
			var testproid = proid.replace( /^\D+/g, '');
			selectedproduct.push(testproid);
		});
		console.log("selectedproduct:"+selectedproduct);
		var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
		var enqcustid = $("#enqcustid").val();
		var enqsource = $("#custenqsource").val();
		var enqfortransition = $("#enqtransition").val();
		var enqdate = $("#enqdata").val();
		var enqtime = $("#enqtime").val();
		var visittype = $("#visittype").val();
		var visitdate = $("#enqvisidate").val();
		var adultcount = $("#adlmembercnt").val();
		var childcount = $("#chlmembercnt").val();
		var grouptype = $("#enqgrptype").val();
		var enqassignto = $("#enqassignto").val();
		var enqremark = $("#enqremark").val();
		var enqstatus = $("#enqstatus").val();
		/*if(enqdate != undefined)
		{
			if(enqdate.match(pattern))
			{var enquirydate = enqdate;}
			else{var enquirydate = datecontr(enqdate);}
			var enqresdt = enquirydate.split("-");
			var enqyear = enqresdt[2];
			var enqmonth =  enqresdt[1];
			var enqdte =  enqresdt[0];
			var custenquirydate= enqyear+'-'+ enqmonth + '-' +  enqdte;
		}else{ }*/
		$scope.enqdetails = [];
		$scope.enqdetails.push({
			"customerid": enqcustid,
			"enquirysource": enqsource,
			"transition":enqfortransition,
			"enquirydate":enqdate,
			"enquirytime":enqtime,
			"visittype":visittype,
			"visitedate": visitdate,
			"visitdate":visitdate,
			"childcount":childcount,
			"grouptype":grouptype,
			"assigned":enqassignto,
			"remark":enqremark,
			"status":enqstatus

		})
		var envalidation = enquiryvalidation($scope.enqdetails);
		console.log("envalidation:"+envalidation);
	}
	function enquiryvalidation($enqdata)
	{
		var date=new Date();var dd=new Date().getDate();
		var mm=new Date().getMonth()+1;var yy=new Date().getFullYear();
		var today=dd+"-"+mm+"-"+yy;
		var status = ''; var status1 = ''; var status2 = ''; var status3 = '';
		var status4 = ''; var status5 = ''; var status6 = ''; var status7 = '';
		if($enqdata[0].customerid == '0' || $enqdata[0].customerid == '')
		{
			console.log("in if");
			document.getElementById("encustname").style.border = "1px solid red";
			document.getElementById("enqcust_error").innerHTML="select customer name.";
			status1=0;
			
		}else{
			console.log("in else");
			status1 = 1
			document.getElementById("enqcust_error").innerHTML="";
			document.getElementById("encustname").style.border = "1px solid #ccc";
		}
		if($enqdata[0].enquirysource == '')
		{
			document.getElementById("enqsource_error").innerHTML="select equiry source.";
			status2=0;
			document.getElementById("custenqsource").style.border = "1px solid red";
		}else{
			status2 = 1;
			document.getElementById("enqsource_error").innerHTML="";
			document.getElementById("custenqsource").style.border = "1px solid #ccc";
		}
		if($enqdata[0].enquirydate=='')
		{
			status3 = 0;
			document.getElementById("enqdate_error").innerHTML="Enter enquiry date.";
			document.getElementById("enqdata").style.border = "1px solid red";
		}
		else
		{
			var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
			var endate = $("#enqdata").val();
			if($enqdata[0].enquirydate.match(pattern))
			{
				var edate = endate;
			}
			else
			{
				var edate = datetosting($enqdata[0].enquirydate);			
			}
			
			if(edate.match(pattern))
			{
				var Ddiff=datediff(edate,today);
				var re=edate.split("-");
				if(re[0]==31)
				{
				var endatediff=Ddiff+1;
				}
				else
				{
				var endatediff=Ddiff;
				}
				if(endatediff < 0)
				{
					document.getElementById("enqdate_error").innerHTML="enquiry date should not be greater than todays date.";	
					status3 = 0;	
					document.getElementById("enqdata").style.border = "1px solid red";
				}
				else
				{
					var ss=validateDate($enqdata[0].enquirydate,"enqdate_error");
					status3 = ss;
				}
			}
			else
			{
				document.getElementById("enqdate_error").innerHTML="Invalid enquiry date.";	
				status3 = 0;
				document.getElementById("enqdata").style.border = "1px solid red";	
			}
		}
		if($enqdata[0].visitedate =='')
		{
			status4 = 1;
			document.getElementById("enqvisitedate_error").innerHTML="";
		}
		else
		{
			var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
			var envidate = $("#enqvisidate").val();
			var envidate = $("#enqdata").val();
			if($enqdata[0].visitedate.match(pattern))
			{
				var evisitedate = envidate;
			}
			else
			{
				var evisitedate = datetosting($enqdata[0].visitedate);			
			}
			
			if($enqdata[0].enquirydate.match(pattern))
			{
				var enqvisitedate = endate;
			}
			else
			{
				var enqvisitedate = datetosting($enqdata[0].enquirydate);			
			}
			if(evisitedate.match(pattern))
			{
				var enddiff=datediff(evisitedate,enqvisitedate);
				console.log("enddiff:"+enddiff);
				var re=evisitedate.split("-");
				if(re[0]==31)
				{
					var endatediff=enddiff+1;
				}
				else
				{
				var endatediff=enddiff;
				}
				if(endatediff > 0)
				{
					document.getElementById("enqvisitedate_error").innerHTML="visit date should not be less than enquiry date.";	
					status4 = 0;	
					document.getElementById("enqvisidate").style.border = "1px solid red";
				}
				else
				{
					var ss=validateDate($enqdata[0].visitedate,"enqvisitedate_error");
					status4 = ss;
				}
			}
			else
			{
				document.getElementById("enqvisitedate_error").innerHTML="Invalid enquiry date.";	
				status4 = 0;	
				document.getElementById("enqvisidate").style.border = "1px solid red";
			}
		}
		if((status1 == 1)&&(status2 == 1)&&(status3 == 1)&&(status4 == 1))
		{
			status = 1;
		}else{
			status = 0;
		}
		return status;
	}
	
});

$(document).on("click", function(e) { 
    var $clicked = $(e.target);
    if (! $clicked.hasClass("enqcustsearch")){
        $("#searchenqcustomerdiv").fadeOut();    
    }
});