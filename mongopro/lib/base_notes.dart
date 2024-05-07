import 'dart:convert';

import 'package:http/http.dart' as http;


const String baseNotesUrl="http://localhost:5000/api/notes/";


class BaseNotes{
  // var client = http.Client;


  Future<dynamic> get(String api,String auth)async{
   var url=Uri.parse(baseNotesUrl+api);
   var _headers={
    'Authorization':'Bearersfie32785757473',
    'api_key':'ief23277371999032hdhe89',
    'auth-token':'${auth}',
   };
   
   var response=await http.get(url,headers:_headers);
   if (response.statusCode==200) {
     return response.body;
   }else{
    //throw error;
   }
  }

// for post and add notes

Future<dynamic> post(String api,dynamic object,String auth)async{
     var url=Uri.parse(baseNotesUrl+api);
     var _payload= json.encode(object);

   var _headers={
    'Authorization':'Bearersfie32785757473',
    'Content-Type' : 'application/json',
    'auth-token':'${auth}',
    'api_key': 'ief23277371999032hdhe89',
   };
   
   var response=await http.post(url,body: _payload,headers:_headers);
   if (response.statusCode==201) {
     return response.body;
   }else{
    //throw error;
   }
  }


}