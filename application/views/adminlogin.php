
<style type="text/css">
  .panel-default {
  opacity: 0.9;
  margin-top:30px;
  }
  .form-control {
      height: 30px;
  }
  .container-fluid{
    padding: 3%;
    height: 100%;
  }
  #loginbody{
    background: #b88df1;
    background: -moz-linear-gradient(top, #b88df1 30%, #eecef9 75%);
    background: -webkit-linear-gradient(top, #b88df1 30%,#eecef9 75%);
    background: linear-gradient(to bottom, #b88df1 30%,#eecef9 75%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b88df1', endColorstr='#eecef9',GradientType=0 );
    background: url("<?php echo base_url();?>assets/images/ind-crm-leaf1.png") no-repeat center center fixed, url("<?php echo base_url();?>assets/images/ind-crm-leaf2.png") no-repeat center center fixed, url("<?php echo base_url();?>assets/images/ind-crm-banner-front.svg") no-repeat center center fixed, url("<?php echo base_url();?>assets/images/ind-crm-banner-bg.png") no-repeat center center fixed,linear-gradient(to bottom, #b88df1 30%,#eecef9 75%) no-repeat center center fixed;
    background-position:23% 88%,81% 88%,40% 88%,45% 70%,0% 0%;
    background-size:100px 150px,100px 150px,1000px 400px,900px 350px,100% 100%;
  }
  .shadow {
     border:0px solid grey;
     border-radius: 0px;
  }
  li {
    list-style: none;
  }

  li:before {
    content: '\f0a4';
    font-family: 'FontAwesome';
    float: left;
    margin-left: -1.5em;
    color: #900190;
  } 

  .link {
    font-size: 0.45em;
  }
  .switch {
  position: relative;
  display: inline-block;
      width: 40px;
    height: 18px;
  }

  .switch input { 
    opacity: 0;
    width: 0;
    height: 0;
  }
  .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #af9124;
    -webkit-transition: .4s;
    transition: .4s;
  }
  .slider:before {
    position: absolute;
    content: "";
    height: 12px;
      width: 16px;
      left: 4px;
      bottom: 3px;
    background-color: #fff;
    -webkit-transition: .4s;
    transition: .4s;
  }
  input:checked + .slider {
    background-color:#ff4700;
  }
  input:focus + .slider {
    box-shadow: 2 2 2px #2196F3;
  }
  input:checked + .slider:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(15px);
  }
  .slider.round {
    border-radius: 34px;
  }
  .slider.round:before {
    border-radius: 50%;
  }
  .btnlogin {
      background-color: #ef223f;
      border: none;
      color: white;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      -webkit-transition-duration: 0.7s; 
      transition-duration: 0.7s;
      cursor: pointer;
  }
  .btnlogin:hover {
      background-color: #000000;
      color: white;
  }
  .btnlogin:active {
      border:none;
  }
  .btnsendotp{
    background-color: #9f39fc;
      border: none;
      color: white;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      -webkit-transition-duration: 0.7s;
      transition-duration: 0.7s;
      cursor: pointer;
  }
  .btnsendotp:hover {
      background-color: #000000;
      color: white;
  }
  #lblforgetpwd:hover {
    color: #ff9b04;
  }
  #lblforgetpwd{
    color: #fff;
  }
  #loginpanel{
    padding-right: 4%;
  }
  #showpassbtn{
    position: absolute;
    top:6px;
    right: 10px;
    font-size: 23px;
    cursor: pointer;
    color: #6b6b6b;
    z-index: 6; 
  }
  #showpassbtn:hover{
    color: black;
  }
  #closemsgbox{
    position: absolute;
    top:9px;
    right: 30px;
    font-size: 15px;
    color: #8c4d00;
    display: none;
  }
  #closemsgbox:hover{
    color:#00588c;
  }
  @media only screen and (max-width: 700px) 
  {
    #loginbody {
        background: #b88df1;
        background: -moz-linear-gradient(top, #b88df1 30%, #eecef9 75%);
        background: -webkit-linear-gradient(top, #b88df1 30%,#eecef9 75%);
        background: linear-gradient(to bottom, #b88df1 30%,#eecef9 75%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b88df1', endColorstr='#eecef9',GradientType=0 );
        background: linear-gradient(to bottom, #b88df1 30%,#eecef9 75%) no-repeat center center fixed;
        background-position:0% 0%;
        background-size:100% 100%;
    }
  }
  .logintextboxs{
    height: auto;border-left: none;font-size: 16px;font-weight: 600;color: #383535;border-radius: 0px;
  }
  //e3eaa6
</style>
<body id="loginbody">
  <div id="loginloader" class="modal" style="display: none;height: 100%;width: 100%;background-color: #0000009c;"></div>
  <div class="container-fluid" style="padding: 0px;margin: 0px;" ng-controller="adminlogin">
    <div class="row"  style="padding: 1% 0% 0% 3%;">
      <div class="col-sm-4 col-md-4 col-xs-12" style="">     
        <a href="#"><img class="pull-left" src="<?php echo base_url();?>assets/images/retailware_logo.png" style="width:100%;height: 100%;" /></a>
      </div>
      <div class="col-sm-8 col-md-7 col-xs-12" style="padding-left: 7%;color: #fff;">
        <h4 style="margin-bottom: 0px; font-weight: 400;"><span style="font-size:40px;margin-bottom: 0px;">CRM Management Solution</span></h4>
        <small style="font-size: 15px;font-weight: 600;letter-spacing:1px;">Version- 1.0.0</small>
      </div>
    </div>
    <div class="row" id="loginpanel">
      <div class="col-md-5 col-md-offset-7" id="loginbox" style="padding: 0px;">
        <div class="panel panel-default shadow" style="background: #0000009c;">
          <div class="panel-body" style="background:none;">
            <form novalidate autocomplete="off">
              <div class="row" style="padding: 5%;">
                <div class="col-xs-12" style="text-align: center;margin-bottom: 4%;">
                  <label class="form-control" style="height: auto;border:none;font-size: 20px;background: #07c398;color:#fff;border-radius: 0px;font-weight: 400;padding: 8px 12px;word-spacing:8px;letter-spacing: 1.0px;">Login Here</label>
                </div>
                <div class="col-xs-12" style="margin-bottom: 2%;">
                  <label class="form-control" id="loginerrmsg" style="height: auto;border:none;background: #3ac120;border-radius: 8px;font-weight: 500;padding: 8px 15px; color: #fff;display: none;font-family: calibri;"></label>
                  <i id="closemsgbox" class="fa fa-close"></i>
                </div>
                <div class="col-xs-12" style="margin-bottom: 5%;padding: 0% 5% 0% 5%;">
                  <div class="input-group">
                    <span class="input-group-addon" style="background: #fff;border-right: none;color: #383535;"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="username" type="text" class="form-control logintextboxs" name="username" placeholder="User Name" ng-model="crmusername">
                  </div>
                </div>
                <div class="col-xs-12" style="margin-bottom: 5%;padding: 0% 5% 0% 5%;">
                  <div class="input-group">
                    <span class="input-group-addon" style="background: #fff;border-right: none;color: #383535;"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="upassword" type="password" class="form-control logintextboxs" name="upassword" placeholder="Password" ng-model="crmpassword">
                    <i id="showpassbtn" onclick="showhidepassword();" class="fa fa-eye"></i>
                  </div>
                  <label id="capsWarning" style="font-weight: normal;font-size: 12px;display: none;color: #fff;padding: 4px 0px 0px 10px;margin: 0px;">Caps Lock is On</lebel>
                </div>
                <div class="col-xs-12" style="text-align: center;margin-bottom: 3%;padding: 0% 10% 0% 10%;">
                  <button class="btn form-control btnlogin btn-sm" style="height: auto;font-size: 18px;border-radius: 25px;" name="loginbtn" id="loginbtn" title="Click to Login" ng-click="verifylogin()">LOGIN</button>
                </div>
                <div class="col-xs-12 col-sm-6" style="font-size: 10px;text-align: center;">
                    <label  style="font-weight: normal;font-size:13px;" title="Remember Password" id="lblforgetpwd">
                      <label class="switch">
                        <input id="chkbxrem_me" type="checkbox" ng-true-value="1" ng-false-value="0">
                        <span class="slider round"></span>
                      </label> Remember Me
                    </label>
                </div>
                <div class="col-xs-12 col-sm-6" style="font-weight: normal;padding-right: 0%;font-size: 13px;text-align: center;">
                  <a href="#" onClick="$('#loginbox').hide(); $('#forgetpwd').show()">
                    <label id="lblforgetpwd" style="font-weight: normal;cursor: pointer;" title="Forgot Password">
                      Forgot Password?
                    </label>
                  </a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="col-md-5 col-md-offset-7" id="forgetpwd" style="display:none;padding:0px;">
        <div class="panel panel-default shadow" style="background: #0000009c;">
          <div class="panel-body" style="background:none;">
            <form novalidate autocomplete="off">
              <div class="row" style="padding: 5% 5% 5.8% 5%;">
                <div class="col-xs-12" style="text-align: center;margin-bottom: 8%;">
                  <label class="form-control" style="height: auto;border:none;font-size: 20px;background: #2196f3;color:#fff;border-radius: 0px;font-weight: 400;padding: 8px 12px;word-spacing:8px;letter-spacing: 1.0px;">Forgot Password</label>
                </div>
                <div class="col-xs-12" style="margin-bottom: 5%;padding: 0% 5% 0% 5%;">
                  <div class="input-group">
                    <span class="input-group-addon" style="background: #fff;border-right: none;color: #383535;"><i class="glyphicon glyphicon-phone"></i></span>
                    <input id="umobileno" type="text" class="form-control logintextboxs" name="umobileno" placeholder="Enter Mobile Number">
                  </div>
                </div>
                <div class="col-xs-12" style="margin-bottom: 5%;padding: 0% 5% 0% 5%;">
                  <div class="input-group">
                    <span class="input-group-addon" style="background: #fff;border-right: none;color: #383535;"><i class="glyphicon glyphicon-envelope"></i></span>
                    <input id="uemail" type="text" class="form-control logintextboxs" name="uemail" placeholder="Enter Email ID">
                  </div>
                </div>
                <div class="col-xs-12" style="text-align: center;margin-bottom: 3%;padding: 0% 10% 0% 10%;">
                  <button class="btn form-control btnsendotp btn-sm" style="height: auto;font-size: 18px;border-radius: 25px;" name="sendbtn" id="sendbtn" title="Click to send Mail or OTP for get Password">Send</button>
                </div>
                <div class="col-xs-12" style="font-weight: normal;padding-right: 3%;font-size: 13px;text-align: left;">
                  <a href="#" onClick="$('#forgetpwd').hide(); $('#loginbox').show()">
                    <label id="lblforgetpwd" style="font-weight: normal;cursor: pointer;" title="Forgot Password">
                        For Login Click here
                    </label>
                  </a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
<script type="text/javascript">
  $(function()
  {
      if (localStorage.chkbx && localStorage.chkbx != '')
      {
        $('#remember_token').attr('checked', 'checked');
          $('#emailid').val(localStorage.sneusername);
          $('#Password').val(localStorage.sneuserpass);
      }
      else
      {
          $('#remember_token').removeAttr('checked');
          $('#emailid').val('');
          $('#Password').val('');
      }
      $('#remember_token').click(function()
      {
          if ($('#remember_token').is(':checked'))
          {
              localStorage.sneusername = $('#emailid').val();
              localStorage.sneuserpass = $('#Password').val();
              localStorage.chkbx = $('#remember_token').val();
          }
          else
          {
              localStorage.sneusername = '';
              localStorage.sneuserpass = '';
              localStorage.chkbx = '';
          }
      });
  });
  var pass = document.getElementById("upassword");
  var text = document.getElementById("capsWarning");
  pass.addEventListener("keyup", function(event) 
  {
    if (event.getModifierState("CapsLock")) 
    {
      text.style.display = "block";
    } 
    else 
    {
      text.style.display = "none"
    }
  });
  pass.addEventListener("focusout", function(event)
  {
    text.style.display = "none";
  });
  function showhidepassword() 
  {
    var x = document.getElementById("upassword");
    var eye = document.getElementById("showpassbtn");
    if (x.type === "password") 
    {
        x.type = "text";
        eye.style.color = "dodgerblue";
    } 
    else 
    {
        x.type = "password";
        eye.style.color = "grey";
    }
  }
  function hidemessage()
  {
   $("#errormsg").html('');
  }
</script>