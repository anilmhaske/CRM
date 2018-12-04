<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include_once (dirname(__FILE__) . "/../DashboardController.php");
class CustomerController extends DashboardController
{
	function __construct() 
	{
		parent::__construct();
		$this->load->library("soap_library", "");
		$this->load->model('customer/Customermodel','cust');
	}
	function index()
	{	
		$this->DisplayNavBar();
		$this->load->view('customer/customerview');
	}
	function getcustomerdata()
	{
		/*$rs = file_get_contents("php://input");
		$a = json_decode($rs);
		$limit = 12;
		if($a->page>1)
		{
			$page = ($a->page-1)*$limit;
		}else{
			$page = 0;
		}*/
		
		$countrydata = $this->cust->getcountrynames();
		$data['countryinfo']=json_decode($countrydata);
		$statedata = $this->cust->getstatenames('91');
		$data['stateinfo']=json_decode($statedata);
		$grpname = $this->cust->getgroupnames();
		$data['groupinfo']=json_decode($grpname);
		echo json_encode($data);
	}
	function getcustomerinformation()
	{
		echo $custmdata = $this->cust->getcustomerinfo();		
	}
	function getcitydata()
	{
		$rs=file_get_contents("php://input");
		$a=json_decode($rs);
		$citydata = $this->cust->getcitynames($a->countryid,$a->stateid,$a->cityname);
		$data['cityinfo']=json_decode($citydata);
		echo json_encode($data);
	}
	public function getaccessdata()
	{
		
		//$query="SELECT * FROM Rplus_AccountContact where Contactdetail = '0414966762'"; 
		$query="SELECT am.* FROM Rplus_AccountMaster am left join RPlus_AccountAddress aa on aa.AccountID=am.AccountID and aa.IsPrimary=1 left join RPlus_AccountContact ac1 on ac1.AccountID=am.AccountID and ac1.IsPrimary =1 and ac1.ContactTypeID =1 
		  left join RPlus_AccountContact ac2 on ac2.AccountID=am.AccountID and  ac2.IsPrimary =1 and ac2.ContactTypeID =3 where am.ISCustomer=1"; 
		/*$query="SELECT ProcessId,Name FROM RPlus_ProcessMaster where ProcessType = 2 and ParentProcessID = '0' and Enabled = 'true' order by ProcessId";
*/
		$resultcart = $this->soap_library->soaprequest($query);
		$totalrecord=json_decode($resultcart, true, 512, JSON_BIGINT_AS_STRING);
		print_r($resultcart);
	}
	function getchangecountrystate()
	{
		$rs=file_get_contents("php://input");
		$a=json_decode($rs);
		$statedata = $this->cust->getstatenames($a->countryid);
		$data['stateinfo']=json_decode($statedata);
		echo json_encode($data);
	}
	public function getstateinfo()
	{
		$countyid=$_POST['CountryID'];
		$result='';
		$statedetails=$this->cust->getstatenames($countyid);
		$statedetail = json_decode($statedetails);
		$state = $statedetail->currenttable;
		foreach($state as $data)
		{
			$result=$result.'<option value="'.$data->StateID.'">'.$data->Name.'</option>';
		}
		echo json_encode($result);
	}
	public function getcityinfo()
	{
		$rs=file_get_contents("php://input");
		$a=json_decode($rs);
		$stateid=$a->stateID;
		$cityname=$a->cityname;
		$citydetails = $this->cust->getcitynames($stateid,$cityname);
		$citydetail = json_decode($citydetails);
		$city = $citydetail->currenttable;
		echo json_encode($city);
	} 
	function verifycustomermobilenumber()
	{
		$rs=file_get_contents("php://input");
		$a=json_decode($rs);
		$mobdata = $this->cust->verifymobile($a->mobile); 
		echo json_encode($mobdata);
	}
	function savecitydata()
	{
		$rs = file_get_contents("php://input");
		$a = json_decode($rs);
		$timezone = new DateTimeZone("Asia/Kolkata" );
		$date = new DateTime();
		$date->setTimezone($timezone );
		$crtdate=$date->format('Y-m-d');
		$ClientID = $this->session->userdata('clientid');
		$BranchID = $this->session->userdata('branchid');
		$UserID = $this->session->userdata('uid');
		$query = "Proc_AddModify_CityMaster '".$ClientID."','".$BranchID."',0,'".$a->cityname."','','".$a->stateid."','".$UserID."',0,'".$crtdate."',0,0,1";
		$result = $this->soap_library->soaprequest($query);
		$data=json_decode($result,true, 512, JSON_BIGINT_AS_STRING);
		echo json_encode($data);
		
	}
	public function searchbycustomer()
	{
		$inputkey=$this->input->post('searchkey');
		


		$datars = $this->cust->srchcustomerdata($inputkey);
		$mainmenu=json_decode($datars);
		foreach($mainmenu->currenttable as $data)
		{
			$bold_search_keyword = '<strong>'.$inputkey.'</strong>';
			echo '<div class="show" align="left" id="">
			<span onclick="getcustomeracid(this.id)" id="'.$data->AccountID.'_'.$data->DisplayName.'">'.str_ireplace($inputkey,$bold_search_keyword,$data->DisplayName).'</span><hr>
			</div>';
		}
	}
}

?>