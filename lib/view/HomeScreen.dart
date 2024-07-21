import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../models/NoteModel.dart';
import '../widgets/NoteCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ToDoController controller = Get.put(ToDoController());
  @override
  void initState() {
    super.initState();
    controller.checkData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDOs"),
      ),
      body: SizedBox(
        height: Get.height,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.getList().length,
            itemBuilder: (context, index) {
              return NoteCard(note: controller.getList()[index]);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(myCard());
          },
          child: Icon(Icons.add)),
    );
  }

  Container myCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(8),
      height: Get.height / 12,
      width: double.infinity,
      child: TextField(
        decoration: const InputDecoration(
          hintText: "Please enter task:",
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            controller.addNote(Note(note: value));
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
