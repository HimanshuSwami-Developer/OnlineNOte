import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongopro/base_notes.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({super.key});

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
 
 List dataList=[];

 @override
  Widget build(BuildContext context) {

  Future datas()async{
 final response=await BaseNotes().get('/getnotes',Get.arguments).catchError((err) {});
  var data= json.decode(response.body.toString());              
  if(response.statusCode==200){
    for (Map<String,dynamic> index in data) {
      dataList.add(data(index));
      print(dataList);
    }
    return dataList;

  }else{
    return dataList;
  }
 }

    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      child: FutureBuilder(
        future: datas(),
        builder: (context, snapshot)  {
          return snapshot.hasData? ListView.builder(itemCount: dataList.length,itemBuilder: (context, index){
                    return Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(trailing: Column(children: [IconButton(onPressed: (){}, icon: Icon(Icons.edit)),IconButton(onPressed: (){}, icon: Icon(Icons.delete))],),),
                            Text(dataList[index]['title']),
                            Text("data"),
                            Text("data"),
      
                          ],
                        ),
                      ),
                    );
         } ):CircularProgressIndicator();
        
          }
      )
,);
  }
}