import 'package:get/get.dart';
import 'package:mongopro/main.dart';
import 'package:mongopro/view/register.dart';

class navigateClass{
 static String home="/";
 static String  getHomeRoute()=>home;

 static String registers="/register";
 static String getRegisterRoute()=>registers;


static List<GetPage> routes =[
   
   GetPage(name: home, page: ()=>Homepage()),

   GetPage(name: registers, page: ()=> Register()),

];

}