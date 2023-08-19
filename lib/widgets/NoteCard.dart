import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../models/NoteModel.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  ToDoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTile(
        leading: Checkbox(
          value: widget.note.isDone,
          onChanged: (newValue) {
            setState(() {
              widget.note.isDone = newValue!;
              controller.updateNote(widget.note);
            });
          },
        ),
        title: Text(
          widget.note.note,
          style: widget.note.isDone
              ? Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(decoration: TextDecoration.lineThrough)
              : Theme.of(context).textTheme.headlineSmall,
        ),
        trailing: IconButton(
          onPressed: () {
            controller.removeNote(widget.note);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
