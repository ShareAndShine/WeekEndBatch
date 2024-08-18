public with sharing class CalloutToGoogle {
    public CalloutToGoogle() {

    }

   public static void makeacallToGoogle(){

    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://www.google.com/search?q=salesforce');
    req.setMethod('GET');

    // make a call 
    HttpResponse res = http.send(req);

    // read the response
    String output = res.getBody();
    System.debug('google response is::' + output);
    
   }


}