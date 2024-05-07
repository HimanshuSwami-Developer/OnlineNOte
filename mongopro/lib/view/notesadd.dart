import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongopro/base_client.dart';
import 'package:mongopro/base_notes.dart';
import 'package:mongopro/controller.dart';
import 'package:mongopro/modals/notesmodal.dart';
import 'package:mongopro/view/notescard.dart';
import 'package:mongopro/view/register.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController tag = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("NoteBook"),
      //   actions: [
      //     ListTile(
      //       trailing: ElevatedButton(
      //           onPressed: () {
      //             print(Get.arguments);
      //           },
      //           child: Text("Log Out")),
      //     )
      //   ],
      // ),
      body:   SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
          
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Add Notes ....",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        controller: title,
                        decoration: InputDecoration(hintText: "enter the title "),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextField(
                        controller: description,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: "enter the description "),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextField(
                        controller: tag,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(hintText: "enter the tag "),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var jsonResponse;
                          var notes = NotesModal(
                              title: title.text.toString(),
                              description: description.text.toString(),
                              tag: tag.text.toString());
      
                          var response = await BaseNotes().post('/addnotes', notes ,Get.arguments)
                              .catchError((err) {});
                          if (response == null) return;
                          Get.offAll(Notes());
                          debugPrint("success");
                        },
                        child: Text("Add Note")),
                    
                   SizedBox(
                      height: 15,
                    ),
                     
                     
                                ],
                ),
              ),
            ),
            Container( height: MediaQuery.of(context).size.height*0.5,child: NotesCard()),
          ],
        ),
      ),
    );
  }
}
