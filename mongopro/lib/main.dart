import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongopro/controller.dart';
import 'package:mongopro/routesClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(()=>Datacontroller)
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Homepage(),
      initialRoute: navigateClass.getHomeRoute(),
      getPages: navigateClass.routes,
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  colorChange controller = Get.put(colorChange());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: GetBuilder<colorChange>(
               builder: (controller) {
                return ListTile(
                  onTap: () {
                    Get.toNamed(navigateClass.getRegisterRoute());
                  },
                  title: Text("profile"),
                  trailing: Icon(Icons.arrow_forward),
                  leading: controller.filled == true
                      ? CircleAvatar(backgroundColor: Colors.grey)
                      : CircleAvatar(backgroundColor: Colors.red),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  colorChange controller = Get.put(colorChange());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Column(
        children: [
          Text("second page"),
           ElevatedButton(onPressed: (){
            Get.toNamed(navigateClass.getHomeRoute(),arguments: controller.colorUpdate());
            
           }, child: Text("submit"))
        ],
      )),
      
    );
  }
}
