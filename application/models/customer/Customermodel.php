<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customermodel extends CI_Model
{
	function __construct() 
	{
		parent::__construct();
		$this->load->library("soap_library", "");
	}
	public function getcountrynames()
	{
		$query="SELECT * FROM RPlus_GeoCountryMaster where CountryID > 0"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
	public function getstatenames($countryid)
	{
		$query="SELECT * FROM RPlus_GeoStateMaster where CountryID = '".$countryid."'"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;	
	}

	function getcitynames($stateid,$cityname)
	{
		$query="SELECT * FROM RPlus_GeoCityMaster where StateID = '".$stateid."' and Name Like '".$cityname."%' "; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;	
	}
	function verifymobile($mobilenumber)
	{
		$mobproc ="Proc_CustomerSerachByMobile '".$mobilenumber."'";

		$procresult = $this->soap_library->soaprequest($mobproc);
		return $opdata = json_decode($procresult, true, 512, JSON_BIGINT_AS_STRING); 
	}
	public function getcustomerinfo()
	{
		$query="SELECT TOP 10 am.* FROM RPlus_AccountMaster am left join RPlus_AccountAddress aa on aa.AccountID=am.AccountID and aa.IsPrimary=1 left join RPlus_AccountContact ac1 on ac1.AccountID=am.AccountID and ac1.IsPrimary =1 and ac1.ContactTypeID =1 left join RPlus_AccountContact ac2 on ac2.AccountID=am.AccountID and  ac2.IsPrimary =1 and ac2.ContactTypeID = 3 where am.ISCustomer=1";
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;	
	}
	function srchcustomerdata($inputkey)
	{
		$query="SELECT AccountID,DisplayName FROM RPlus_AccountMaster WHERE DisplayName Like '".$inputkey."%' "; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
	public function getgroupnames()
	{
		$query="select * from Rplus_EnumMaster where MasterName = 'Group Name' and Disabled=1"; 
		$resultcart = $this->soap_library->soaprequest($query);
		return $resultcart;
	}
}
?>