app.controller('adminlogin',function($scope,$http,$rootScope,$compile)
{
	getuserinfo();
	function getuserinfo()
	{
		$scope.crmusername=getCookie('crmusername');
		$scope.crmpassword=getCookie('crmpassword');
	}
	$scope.verifylogin = function()
	{
		var username=$("#username").val();
		var password=$("#upassword").val();
		if($("#chkbxrem_me").prop("checked") == true){
            var rememberme=1;
        }
        else if($("#chkbxrem_me").prop("checked") == false){
            var rememberme=0;
        }
		var validlogin=CheckValidation(username,password);
		//var validlogin=true;
		if(validlogin==true)
		{  
			$("#loginloader").show();
			$("#loginloader").html('<img src="assets/images/loader1.gif" alt="Wait" style="left:40%;top:30%;position:absolute;z-index:9999;height:150px;width:150px;" />');
			$http({
	                method: 'POST',
	                url: 'crmmanagement/validatelogin',
	                headers: {'Content-Type': 'application/json'},
	                data: {username:username,password:password}
	            }).then(function(response)
	            {
	            	//console.log(response);
	            	$scope.Isuser=response.data;
	                if($scope.Isuser==1)
	                {
	                	$("#loginerrmsg").css("background-color", "#10a915");
						$("#loginerrmsg").html("Login Successfully.");
						$("#loginerrmsg").show();
						$("#closemsgbox").show();
						$("#loginerrmsg").fadeOut(2000);
						$("#closemsgbox").fadeOut(2000);
						if(rememberme==1)
				        {
				        	setCookie("crmusername",username,10);
				        	setCookie("crmpassword",password,10);
				        }
						window.location.href = 'dashboard';
	                }
	                else if($scope.Isuser==2)
	                {
	                	$("#loginerrmsg").css("background-color", "#e22c2c");
						$("#loginerrmsg").html("User is Deactivated.Login Failed !!");
						$("#loginerrmsg").show();
						$("#closemsgbox").show();
						$("#loginerrmsg").fadeOut(10000);
						$("#closemsgbox").fadeOut(10000);
	                }
	                else
	                {
	                	$("#loginerrmsg").css("background-color", "#e22c2c");
						$("#loginerrmsg").html("Invalid UserName Or Password!!!");
						$("#loginerrmsg").show();
						$("#closemsgbox").show();
						$("#loginerrmsg").fadeOut(8000);
						$("#closemsgbox").fadeOut(8000);
	                }
	                $("#loginloader").hide();
					$("#loginloader").html('');
	            });			
		}
	}
	function setCookie(cname, cvalue, exdays) {
	    var d = new Date();
	    d.setTime(d.getTime() + (exdays*24*60*60*1000));
	    var expires = "expires="+ d.toUTCString();
	    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
	function getCookie(cname) 
	{
	    var name = cname + "=";
	    var decodedCookie = decodeURIComponent(document.cookie);
	    var ca = decodedCookie.split(';');
	    for(var i = 0; i <ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }
	    return "";
	}
	function CheckValidation(username,password)
	{
		var status='';
		var username=username.trim();
		if(username=='')
		{
			var status=false;
			displayerror(1,'Enter UserName');
		}
		else
		{
			var status=true;
			displayerror(2,'');
		}
		if(status==true)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	function displayerror(type,message)
	{
		if(type==1)
		{
			$("#loginerrmsg").css("background-color", "#e22c2c");
			$("#loginerrmsg").html(message);
			$("#loginerrmsg").show();
			$("#closemsgbox").show();
			/*$("#loginerrmsg").fadeOut(8000);
			$("#closemsgbox").fadeOut(8000);*/
		}
		else
		{
			$("#loginerrmsg").html(message);
			$("#loginerrmsg").hide();
			$("#closemsgbox").hide();
		}
	}
	$("#closemsgbox").click(function(){
        $("#loginerrmsg").fadeOut(1500);
        $("#closemsgbox").fadeOut(1500);
    });
});
