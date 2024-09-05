import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/note_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesController notesController = Get.put(NotesController());
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Obx(() {
        if (notesController.notesList.isEmpty) {
          return Center(child: Text('No notes available'));
        } else {
          return ListView.builder(
            itemCount: notesController.notesList.length,
            itemBuilder: (context, index) {
              final note = notesController.notesList[index];
              return ListTile(
                title: Text(note['title'] ?? ''),
                subtitle: Text(note['description'] ?? ''),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add-note');  // Navigate to Add Notes Page
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
