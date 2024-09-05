import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/note_controller.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final NotesController notesController = Get.find<NotesController>();
    return Scaffold(
      appBar: AppBar(title: Text('Add Note')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final String title = titleController.text.trim();
                final String description = descriptionController.text.trim();

                if (title.isNotEmpty && description.isNotEmpty) {
                  await notesController.addNote(title, description);
                  Get.back();  // Go back to the previous screen after adding the note
                } else {
                  Get.snackbar('Error', 'Please fill in both fields');
                }
              },
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
