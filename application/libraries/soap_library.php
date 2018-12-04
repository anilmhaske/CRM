<?php

class soap_library
{
   function soap_library()
   {
       require_once('lib/nusoap.php');
   }
   function soaprequest($query)
	{
		$service='dbexchange';
		if ($service != '' && $query!='')
		{
			$api_url='https://rprocrm.azurewebsites.net/dbconnector/service/crossplatform.asmx';
			//$api_url='http://192.168.2.254/Anil/crm/dbconnector/service/crossplatform.asmx';
			$wsdl = $api_url."?wsdl";
			$client = new nusoap_client($wsdl, 'wsdl');
			$params=array('SecurityKey'=>'05751c3f8e894d6cb8bab653523fddcb','Script' => $query);
			
			$result = $client->call($service, $params);
			$error = $client->getError();
			if($error)
				{
					//print_r($result);
					return 'poor internet connection';
				}
				else
				{
					$result_arr = $result['dbexchangeResult'];
					return $result_arr;
				}
		}else{
		return 'error';
		}
		
	}
}

?>