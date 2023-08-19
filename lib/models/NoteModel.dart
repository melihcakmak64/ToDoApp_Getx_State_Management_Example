import 'package:hive/hive.dart';
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  final String note;

  @HiveField(1)
  final String id;

  @HiveField(2)
  bool isDone = false;

  Note({required this.note})
      : id = DateTime.now().toString(); //Date is used as a unique id.

  String getId() {
    return id;
  }
}
