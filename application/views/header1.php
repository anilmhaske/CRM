<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html ng-app="retailwarecrmmanagement">
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CRM Management</title>
	<link href="<?php echo base_url();?>assets/css/font-awesome.min.css" rel="stylesheet" />
	<link href="<?php echo base_url('assets/css/jquery-ui.min.css');?>" rel="stylesheet" type="text/css"/>
	<link href="<?php echo base_url();?>assets/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="<?php echo base_url();?>assets/css/global.css" rel="stylesheet" />	
	<link href="<?php echo base_url();?>assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/> 
	<script src="<?php echo base_url('assets/js/jquery.min.js');?>"></script>
	<script src="<?php echo base_url('assets/js/jquery-ui.min.js');?>"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/moment.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/bootstrap.min.js">
	</script>
	<script type="text/javascript" src="<?php echo base_url('assets/js/bootstrap-datetimepicker.min.js');?>"></script>
	<script type="text/javascript" src="<?php echo base_url('assets/js/bootstrap-datetimepicker.min.js');?>"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/angular.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/angular-route.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/angular-sanitize.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/dirPagination.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>app/route.js"></script>
	
</head>
<body>
<div class="container-fluid" style="background: #ffffffd6;padding: 0px;margin: 0px;">
    <div class="row" id="header" style="margin-right: 0px;margin-left: 0px;padding: 8px 0px;">
      <div class="col-sm-3" style="padding: 0px 0px 0px 20px;">     
        <a href="#"><img class="pull-left" src="<?php echo base_url();?>assets/images/retailware_logo.png" style="width: 100%;height: 100%;" /></a>
      </div>
      <div class="col-sm-9" style="padding-left: 7%;">
        <h4 style="margin-bottom: 0px; font-weight: 400;font-family:Calibri;"><span style="font-size:37px;margin-bottom: 0px;">CRM Management Solution</span></h4>
        <small>Version- 1.0.0</small>
      </div>
    </div>
  </div>