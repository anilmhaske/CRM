<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class DashboardController extends CI_Controller
{
	function __construct() 
	{
		parent::__construct();
		$this->load->model('DashboardModel','dash');
	}
	public function index()
	{
		$this->DisplayNavBar();
		$this->load->view('dashboardbody');
	}
	public function DisplayNavBar()
	{
		if($this->session->userdata('uid')==true)
		{
			$dataMainMenu=$this->dash->AccessTopMenu();
			$mainmenu=json_decode($dataMainMenu);
			foreach($mainmenu->currenttable as $custdetail)
			{
				$menuid[] = $custdetail->ProcessId;
			}
			$parentmid = "'" . implode ( "', '", $menuid ) . "'";
			$dataSubMenu=$this->dash->AccessSubMenu($parentmid);
			$submenudata=json_decode($dataSubMenu);
			$result['MainMenu']=$mainmenu;
			$result['SubMenu']=$submenudata;
			//print_r($result);
			$this->load->view('header');
			$this->load->view('homepage',$result);
			//$this->load->view('dashboardbody');
		}
		else
		{
			redirect('crmmanagement');
		}
		
	}
}

?>