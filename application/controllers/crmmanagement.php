<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Crmmanagement extends CI_Controller {
	function __construct() 
	{
		parent::__construct();
	}
	public function index()
	{
		$this->load->view('header');
		$this->load->view('adminlogin');
	}
	function validatelogin()
	{
		$this->load->library("soap_library", "");
		$input=file_get_contents("php://input");
		$p=json_decode($input);
		$username=$p->username;
		$password=$p->password;
		$query="Proc_ValidateUser 0,0,'".$username."','".$password."','','',2";
		$result = $this->soap_library->soaprequest($query);
		$data=json_decode($result,true, 512, JSON_BIGINT_AS_STRING);
		if(count($data['currenttable']>0))
		{
			if($data['currenttable'][0]['IsUser']>0)
			{
				if($data['currenttable'][0]['Disabled']==0)
				{
					$useracid=$data['currenttable'][0]['UserID'];
					$cid=$data['currenttable'][0]['ClientID'];
					$branchid=$data['currenttable'][0]['ClientID'];
					$Adminname=$data['currenttable'][0]['UserName'];
					$this->session->set_userdata('uid', $useracid);
					$this->session->set_userdata('clientid', $cid);
					$this->session->set_userdata('branchid', $branchid);
					echo'1';
				}
				else
				{
					echo "2";
				}
			}
			else 
			{
				echo'0';
			}
		}
		else
		{
			echo '0';
		} 	
	}
	function LogOutCRM()
	{	
		$this->session->unset_userdata('uid');
		$this->load->view('header');
		$this->load->view('adminlogin');
	}
}

