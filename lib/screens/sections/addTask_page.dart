import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';
import 'package:hafiz_akbari/models/note_model.dart';
import 'package:hafiz_akbari/services/note_services.dart';
import 'note_page.dart';

late String taskName;

class AddTaskPage extends StatefulWidget {
  //final GlobalKey<NotePageState> notePage;
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
     var keyGetData=GlobalKey<NotePageState>();
     TextEditingController _taskNameController=TextEditingController();
     DateTime now=DateTime.now();
     var _note=Note();
     var _noteService=NoteServices();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: kButtonColor,
      title:const Center(child: Text(
        'ایجاد یادداشت',
        style: TextStyle(
          color: kWhiteColor,
        ),
      )),
      children: [
         Padding(
          padding: paddingBy16,
          child:  Directionality(
            textDirection: textDirection,
            child: TextField(
              controller: _taskNameController,
              style:const TextStyle(
                color: kWhiteColor
              ),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: kWhiteColor
                  )
                ),
                focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: kWhiteColor
                      )
                )
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                 primary: kMainColor
              ),
              onPressed: ()async{
                String date=now.year.toString()+'/'+now.month.toString()+'/'+now.day.toString();
                _note.taskName = _taskNameController.text;
                _note.taskDate = date;
                var result=await _noteService.saveNote(_note);
                Navigator.of(context).pop();
              },
              child:const Text(
                'افزودن'
              )
          ),
        )
      ],
    );
  }
}