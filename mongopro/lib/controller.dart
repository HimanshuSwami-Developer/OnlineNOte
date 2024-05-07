import 'package:get/get.dart';
import 'package:mongopro/view/register.dart';

class colorChange extends GetxController{
   bool filled=true;

   colorUpdate(){
    if(filled==true){
      filled=false;
      update();
    }
    else{
      filled=true;
      update();
    }
   }
}
class AuthController extends GetxController{
  String authText="";
  
  authget(){
    if (authText==null) {
      print("null");
    }
    else{
      print(authText);
      update();
    }
    
  }
  
}