<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class DashboardModel extends CI_Model
{
	function __construct() 
	{
		parent::__construct();
		$this->load->library("soap_library", "");
	}
	public function AccessTopMenu()
	{
		$query="SELECT ProcessId,Name FROM RPlus_ProcessMaster where ProcessType = 2 and ParentProcessID = '0' and Enabled = 'true' order by ProcessId";
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
	public function AccessSubMenu($parentid)
	{
		$query="SELECT ProcessId,ParentProcessID,Name FROM RPlus_ProcessMaster where ProcessType = 2 and ParentProcessID IN($parentid) and Enabled = 'true' order by ProcessId";
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
}
?>