import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl="http://192.168.43.215:8080/api/auth/";

class BaseClient{
  var client = http.Client();

  Future<dynamic> get(String api)async{
   var url=Uri.parse(baseUrl+api);
   var _headers={
    'Authorization':'Bearersfie32785757473',
    'api_key':'ief23277371999032hdhe89',
   };
   
   var response=await client.get(url,headers:_headers);
   if (response.statusCode==200) {
     return response.body;
   }else{
    //throw error;
   }
  }


// for post and add user

Future<dynamic> post(String api,dynamic object)async{
     var url=Uri.parse(baseUrl+api);
     var _payload= json.encode(object);
   var _headers={
    'Authorization':'Bearersfie32785757473',
    'Content-Type' : 'application/json',
    'api_key': 'ief23277371999032hdhe89',
   };
   
   var response=await client.post(url,body: _payload,headers:_headers);
   if (response.statusCode==200) {
     return response.body;
   }else{
    //throw error;
   }
  }

  Future<dynamic> put(String api)async{
    
  }
  
  Future<dynamic> delete(String api)async{
    
  }
}


///notes post ////////////////////////////////////////////////////////////////


