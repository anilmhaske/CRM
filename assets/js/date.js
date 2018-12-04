
function validateDate(date,textid)
{
	var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
	if(date.match(pattern))
	{
		var newdate=date;
	}
	else
	{
		var newdate=datetosting(date);

	}
	if(newdate.match(pattern))
	{
		var str =newdate;
		var res = str.split("-");
		var m=res[1];
		if((res[0] < 1 || res[0] > 31)) 
		{

			var status9a=0;
		}else{
			var status9a=1;

		}
		if(res[1] < 1 || res[1] > 12)
		{

			var status9b=0;
		}else{
			var status9b=1;

		}
		if(res[2] < 1902 || res[2] > (new Date()).getFullYear())
		{


			var status9c=0;
		}else{
			var status9c=1;

		}
		if(res[1]==02 )
		{
			var leapYear = 0;
			if ((!(res[2] % 4) && res[2] % 100) || !(res[2] % 400))
			{
				leapYear = 1;
			}
			if ((leapYear == 0) && (res[0] >= 29)) 
			{
				var status9d=0;
			}
			else if ((leapYear == 1) && (res[0] > 29))
			{
				var status9d=0;
			}
			else{
				var status9d=1;
			}
		}
		else
		{
			var status9d=1;	
		}
		if(status9a==1 && status9b==1 && status9c==1 && status9d==1)
		{
			var s="";
			var status9=1;
		}
		else{
			var status9=0;	
			if(leapYear==1)
			{
				var s="Date is not in proper format(leap year).";
			}
			else if(leapYear==0  && m==2)
			{
				var s="Date is not in proper format(not leap year).";
			}
			else
			{
				var s="Date is not in proper format.";
			}
		}
	}
	else
	{
		var s="Date is not in DD-MM-YYYY format.";	
		var status9=0;	
	}

	document.getElementById(textid).innerHTML=s;
	return status9;
}
function datetosting(date)
{
	var res = date.split("-");


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
	return weddate;
}
function gettodaysdate()
{
	var today = new Date();
	var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		if(dd<10) {
			dd = '0'+dd
		} 
		if(mm<10) {
			mm = '0'+mm
		} 

		today = dd + '-' + mm + '-' + yyyy;
		return today;
	}
	function datediff(a,b)
	{
	//alert("hello");
	var _MS_PER_DAY = 1000 * 60 * 60 * 24;
	var strd =a;
	var resd = strd.split("-");
	var strw =b;
	var resw = strw.split("-");
	var utc1 = Date.UTC(resd[2],resd[1], resd[0]);
	var utc2 = Date.UTC(resw[2],resw[1], resw[0]);
	return Math.floor((utc2 - utc1) / _MS_PER_DAY);
}


function todaysdatesplit(passdate)
{
	var dtpattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
	var res = passdate.split("-");
	var bctday =  res[0];
	var bctmonth =  res[1];
	if(passdate.match(dtpattern))
		{var admdate = passdate;	}
	else{var admdate = datecontr(passdate);}
	var cres = admdate.split("-");
	var bcchtmonth =  cres[1];
	var today = new Date();
	var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			if(dd<10) {
				dd = '0'+dd
			} 
			if(mm<10) {
				mm = '0'+mm
			} 
			var todaydate = dd + '-' + mm + '-' + yyyy;
			return admdatediff = datediff(admdate,todaydate);
		}
		function todaysdatesplithealth(passdate)
		{
    //console.log("passdate:"+passdate);
    var dtpattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
    var res = passdate.split("-");
    var bctyear =  res[0];
    var bctmonth =  res[1];
    var bctday =  res[2];
    var date = bctday + '-' + bctmonth + '-' + bctyear;
    if(date.match(dtpattern))
    	{var admdate = date;}
    else{var admdate = datecontr(date);}
    var cres = admdate.split("-");
    var bcchtmonth =  cres[1];
    var today = new Date();
    var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if(dd<10) 
	{
		dd = '0'+dd
	} 
	if(mm<10) 
	{			
		mm = '0'+mm
	} 
	var todaydate = dd + '-' + mm + '-' + yyyy;
	return admdatediff = datediff(admdate,todaydate);
}

function datetostingInYMDhealth(passdate)
{
	var res = passdate.split("-");
	var year =  res[0];
	var month =  res[1];
	var day =  res[2];

	var date=   year+'-'+ month + '-' +  day;
	return date;
}
function commonfromtodatevalidation(fromdateval,todateval,fromdateerror,todateerror)
{
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if(dd<10) {
		dd = '0'+dd
	} 
	if(mm<10) {
		mm = '0'+mm
	} 
	var todaydate = dd + '-' + mm + '-' + yyyy;
	document.getElementById(fromdateerror).innerHTML = "";
	document.getElementById(todateerror).innerHTML = "";
	var datepattern = /^(\d{1,2})-(\d{1,2})-(\d{4})$/;
	var pattern = /^([0-9]{2})-([0-9]{2})-([0-9]{4})$/;
	var fdate = commondatechange(fromdateval);
	var tdate = commondatechange(todateval);
	var status =0;
	var status1 ='';
	if(fromdateval == '' && todateval == '')
	{
		status1 = true;
		document.getElementById(fromdateerror).innerHTML="";
		document.getElementById(todateerror).innerHTML="";
	}
	else if(fromdateval == '' && todateval != '')
	{
		if(todateval.match(pattern))
			{var tdate = todateval;}
		else{var tdate = commondatechange(todateval);}
		var res = tdate.split("-");
		var tmonth =  res[1];
		if(tmonth == 13)
		{
			document.getElementById(todateerror).innerHTML="Invalid To Date.";
		}
		else
		{
			if(fromdateval == '')
			{
				status1 = false;
				document.getElementById(fromdateerror).innerHTML="select From Date.";
			}
			else if(!tdate.match(datepattern))
			{
				status1 = false;
				document.getElementById(todateerror).innerHTML="Invalid To Date.";
			}
			else
			{
				status1 = true;
				document.getElementById(todateerror).innerHTML="";
			}
		}
	}
	else if(fromdateval != '' && todateval == '')
	{
		if(fromdateval.match(pattern))
			{var fdate = fromdateval;}
		else{var fdate = commondatechange(fromdateval);}
		var res = fdate.split("-");
		var tmonth =  res[1];
		var fdtodydiff = commondetaildatediff(fdate,todaydate);
		if(tmonth == 13)
		{
			document.getElementById(fromdateerror).innerHTML="Invalid from date.Date format should be DD-MM-YYYY.";
		}
		else
		{
			if(!fdate.match(datepattern))
			{
				status1 = false;
				document.getElementById(fromdateerror).innerHTML="Invalid from date.Date format should be DD-MM-YYYY.";
			}
			else if(fdtodydiff <0)
			{
				status1 = false;
				document.getElementById(fromdateerror).innerHTML="Invalid from date.Date should be less than current date.";
			}
			else{
				status1 = true;
				document.getElementById(fromdateerror).innerHTML="";
			}
		}
	}
	else if(fromdateval != '' && todateval != '')
	{
		if(fromdateval.match(pattern))
			{var fdate = fromdateval;}
		else{var fdate = commondatechange(fromdateval);}

		if(todateval.match(pattern))
			{var tdate = todateval;}
		else{var tdate = commondatechange(todateval);}

		var res = fdate.split("-");
		var tmonth =  res[1];
		var tres = tdate.split("-");
		var ftmonth =  tres[1];
		if(tmonth == 13)
		{
			var st =false;
			document.getElementById(fromdateerror).innerHTML="Invalid from date.";
		}
		else
		{
			var st =true;
			document.getElementById(fromdateerror).innerHTML="";
		}
		if(ftmonth == 13)
		{
			var st1 =false;
			document.getElementById(todateerror).innerHTML="Invalid to date.";
		}
		else
		{
			var st1 =true;
			document.getElementById(todateerror).innerHTML="";
		}
		if((st==true)&&(st1==true))
		{
			var bthstatus = 1;
		}
		else{
			var bthstatus = 0;
		}
		if(bthstatus==0)
		{}
	else
	{
		var fdtodydiff = commondetaildatediff(fdate,todaydate);
		var datref = commondetaildatediff(fdate,tdate);
		if(!fdate.match(datepattern))
		{
			status1 = false;
			document.getElementById(fromdateerror).innerHTML="Invalid From Date.";
		}
		else if(!tdate.match(datepattern))
		{
			status1 = false;
			document.getElementById(todateerror).innerHTML="Invalid To Date.";
		}
		else if(fdtodydiff <0)
		{
			document.getElementById(fromdateerror).innerHTML="Invalid from date.";
			status1 = false;
		}
		else if (datref <0)
		{
			document.getElementById(todateerror).innerHTML="To Date should be greater than From Date.";
			status1 = false;
		}
		else
		{
			status1 = true;
			document.getElementById(fromdateerror).innerHTML="";
			document.getElementById(todateerror).innerHTML="";
		}
	}
}
else
{
	status1 = true;
}
if((status1==true)){
	status=1;
}else{
	status=0;
}
return status;
}
function convertdate(needtoconvertdate)
{
	var res = needtoconvertdate.split("-");
	var year = res[2];
	var month =  res[1];
	switch(res[1]) 
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
		default:
		month="NA";
	}
	if(month=='NA'){
		return 'NA';
	}else{
		var day = res[0];
		var Converteddate=   day+'-'+ month + '-' +year;
		return Converteddate;
	}
}

function convertdatetoproperformat(date)
{

	var dd=new Date(date).getDate();
	var mm=new Date(date).getMonth()+1;
	var yy=new Date(date).getFullYear();
	var today=dd+"-"+mm+"-"+yy;
	return today;
}
function userformatDate(date) {
	var monthNames = [
	"Jan", "Feb", "Mar",
	"Apr", "May", "Jun", "Jul",
	"Aug", "Sept", "Oct",
	"Nov", "Dec"
	];

	var day = date.getDate();
	var monthIndex = date.getMonth();
	var year = date.getFullYear();

	return day + '-' + monthNames[monthIndex] + '-' + year;
}
function custonclick(textboxid,textboxerrorid)
{
	document.getElementById(textboxid).style.border = "1px solid #ccc";
	document.getElementById(textboxerrorid).innerHTML="";
}