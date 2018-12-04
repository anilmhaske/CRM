<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include_once (dirname(__FILE__) . "/../DashboardController.php");
class MY_Enquiryactioncontroller extends DashboardController
{
	function __construct()
	{
		parent::__construct();
		$this->load->library("soap_library", "");
		$this->load->model('enquiry/Enquirymodel','enq');
	}
	function index()
	{
		$this->DisplayNavBar();
		$this->load->view('Enquiry/enquiryview');
	}
	function getcustenqinformation()
	{
		$rs = file_get_contents("php://input");
		$a = json_decode($rs);
		$custdata = $this->enq->getenquirycustnames($a->custname);
		$data['enqcustinfo']=json_decode($custdata);
		echo json_encode($data);
	}
	function getcustenquiryinformation()
	{

	}
	function getcustenquiryotherinformation()
	{
		$enqdata = $this->enq->getenquirysrcnames();
		$data['enqsrcinfo']=json_decode($enqdata);
		$enqgrpdata = $this->enq->getenquirygroupnames();
		$data['enqgrpinfo']=json_decode($enqgrpdata);
		$enqproductdata = $this->enq->getenquiryproducts();
		$data['enqproduct']=json_decode($enqproductdata);
		$enqrequirementdata = $this->enq->getenquiryrequirements();
		$data['enqrequirements']=json_decode($enqrequirementdata);
		$salesmandata = $this->enq->getsalesman();
		$data['salesman']=json_decode($salesmandata);
		echo json_encode($data);	
	}
}
?>