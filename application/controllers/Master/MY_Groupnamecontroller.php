<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include_once (dirname(__FILE__) . "/../DashboardController.php");
class MY_Groupnamecontroller extends DashboardController
{
	function __construct() 
	{
		parent::__construct();
		//$this->load->model('DashboardModel','dash');
	}
	function index()
	{
		$this->DisplayNavBar();
		$this->load->view('Master/masterview');
	}
}
?>