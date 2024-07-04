global class ParkServiceMock implements WebServiceMock {
    
    global void doInvoke(Object stub,Object request,Map<String, Object> response,String endpoint,
           String soapAction,String requestName,String responseNS,String responseName,String responseType){
        		ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
                List<String> country = new List<String>();
               	country.add('Inamdar Shola National Park');
                country.add('Riza National Park');
                country.add('Shilpa National Park');
            	response_x.return_x = country;
                response.put('response_x', response_x);
    	}   

}