import 'package:flutter/material.dart';
import 'package:hafiz_akbari/constants.dart';
import 'package:hafiz_akbari/models/note_model.dart';
import 'package:hafiz_akbari/screens/sections/addTask_page.dart';
import 'package:hafiz_akbari/services/note_services.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => NotePageState();
}

class NotePageState extends State<NotePage> {
  late List<Note> _noteList;
  var _noteService=NoteServices();

   getAllNote() async{
    _noteList=<Note>[];
    var note=await _noteService.readTask();
    note.forEach((note){
      setState(() {
        var noteModel=Note();
        noteModel.taskName=note['task_name'];
        noteModel.taskDate=note['task_date'];
        noteModel.id=note['id'];
        _noteList.add(noteModel);
      });
    });
  }

  @override
  initState(){
    super.initState();
    getAllNote();
  }

  _deleteFormDialog(BuildContext context,int index){
    return showDialog(
        context: context,
        builder: (param)=>  AlertDialog(
          backgroundColor: kButtonColor,
          title:const  Directionality(textDirection: textDirection,
              child: Text(
                  'حذف شود؟',
                style: TextStyle(
                  color: kWhiteColor
                ),
              )
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kMainColor
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child:const Text(
                    'نخیر'
                )
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red
                  ),
                  onPressed: ()async{
                    var result= await _noteService.deleteTask(_noteList[index].id);
                    if(result>0){
                    Navigator.of(context).pop();
                    getAllNote();
                    }
                  },
                  child:const Text(
                      'بلی'
                  )
              ),
            ),
            sizedBox10
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Container(
            child: _noteList.length>0 ? Padding(
              padding: paddingBy5,
              child: ListView.builder(
                  itemCount: _noteList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 5.0),
                      child: Opacity(
                        opacity: 0.7,
                        child: Container(
                           decoration: BoxDecoration(
                           color: const Color(0xff0f2f4c),
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(
                             color: Colors.white,
                             width: .2
                           ),
                          ),
                          child: Directionality(
                            textDirection: textDirection,
                            child: ListTile(
                              leading: IconButton(
                                  icon:const Icon(
                                    Icons.edit,
                                    color: kFontColor,
                                  ),
                                  onPressed: (){}
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _noteList[index].taskName,
                                    style:const TextStyle(
                                      color: kWhiteColor
                                    ),
                                  ),
                                  IconButton(
                                      icon:const Icon(
                                          Icons.delete,
                                        color: Color(0xffcc0000),
                                      ),
                                      onPressed: (){
                                        _deleteFormDialog(context,index);
                                      }
                                  )
                                ],
                              ),
                              subtitle: Text(
                                _noteList[index].taskDate,
                                style:  TextStyle(
                                  color: kFontColor.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  ),
            ) :
           Center(
            child: Text(
               'فهرست خالی است',
               style: TextStyle(
                color: kWhiteColor.withOpacity(0.6),
                fontSize: 25.0,
               ),
           ),
         )
        ),
        Positioned(
          top: 390.0,
          left: 160.0,
          child: Opacity(
            opacity: 0.7,
            child: Container(
              height: 50.0,
              width: 50.0,
              child: FloatingActionButton(
                splashColor: kMainColor,
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context)=> AddTaskPage()
                  ).then((value) => {
                     setState((){
                       getAllNote();
                     })
                  });
                },
                child:const Icon(
                  Icons.add,
                  color: kWhiteColor,
                  size: 35.0,
                ),
                backgroundColor: kButtonColor,
              ),
            ),
          ),
        ),
        sizedBox80
      ],
    );
  }
}
