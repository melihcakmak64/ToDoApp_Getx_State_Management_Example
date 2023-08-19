import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/NoteModel.dart';

class ToDoController extends GetxController {
  final RxList<Note> _toDoList = <Note>[].obs;
  final Box _todoBox = Hive.box<Note>("todo_box");

  Future<void> addNote(Note note) async {
    _toDoList.add(note);
    await _todoBox.add(note);
  }

  void removeNote(Note note) {
    _toDoList.removeWhere((element) => element.getId() == note.getId());
    _todoBox.delete(note.key);
  }

  void updateNote(Note note) {
    _todoBox.put(note.key, note);
  }

  RxList<Note> getList() {
    return _toDoList;
  }

  Future<void> checkData() async {
    var list = await _todoBox.values.cast<Note>().toList();
    _toDoList.addAll(list);
  }
}
