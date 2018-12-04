<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Enquirymodel extends CI_Model
{
	function __construct() 
	{
		parent::__construct();
		$this->load->library("soap_library", "");
	}
	function getenquirycustnames($custname)
	{
		$query="SELECT AccountID,DisplayName FROM RPlus_AccountMaster WHERE DisplayName Like '%".$custname."%' "; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}

	function getenquirysrcnames()
	{
		$query="select * from Rplus_EnumMaster where MasterName = 'Enquiry source' and Disabled=1"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
	function getenquirygroupnames()
	{
		$query="select * from Rplus_EnumMaster where MasterName = 'Group Name' and Disabled=1"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
	function getenquiryproducts()
	{
		$query="select ProductID,DisplayName from Rplus_ProductMaster where Disabled = 1"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
	function getenquiryrequirements()
	{
		$query="select * from Rplus_EnumMaster where MasterName = 'Facility' and Disabled=1"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
	function getsalesman()
	{
		$query="select AccountID,DisplayName from Rplus_AccountMaster where IsSalesman = '1' and Disabled=0"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
}