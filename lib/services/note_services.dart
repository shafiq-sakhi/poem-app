import 'package:hafiz_akbari/models/note_model.dart';
import 'package:hafiz_akbari/repositories/repository.dart';

class NoteServices{
  late Repository _repository;

  NoteServices(){
    _repository=Repository();
  }

  saveNote(Note note)async{
    return await _repository.insertData('tasks', note.noteMapping());
  }

  readTask()async{
    return await _repository.readData('tasks');
  }

  deleteTask(noteId)async {
    return await _repository.deleteData('task',noteId);
  }

}