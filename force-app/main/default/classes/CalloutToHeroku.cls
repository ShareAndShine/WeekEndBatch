public with sharing class CalloutToHeroku {
   

    public static void makeGetCall()
    {

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
    
        // make a call 
        HttpResponse res = http.send(req);
    
        // read the jSON response

        if(res.getStatusCode() == 200)
        {
                // Deserialize the JSON response
                Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
                
                System.debug('results::' + results);

                // read the JSON values by using key 'Animals'
                // Convert that into a list so we can loop thru and print
                List<Object> animals = (List<Object>)results.get('animals');

                for(Object animal: animals)
                {
                    System.debug('animal is::' + animal);
                }

            
                String output = res.getBody();
                System.debug('google response is::' + output);
        }
    }

    public static void makePostCall()
    {

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setMethod('POST');

        // ser the body as JSON Objet
        req.setBody('{"name":"Petter the rabbit"}');
    
        // make a call to API
        HttpResponse res = http.send(req);
    
        // print  response
        System.debug('response with new data:: ' + res.getBody());

        
    }

}