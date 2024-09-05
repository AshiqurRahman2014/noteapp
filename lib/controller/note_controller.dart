import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var notesList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  void fetchNotes() {
    _firestore.collection('notes').orderBy('created_at', descending: true).snapshots().listen((snapshot) {
      notesList.value = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> addNote(String title, String description) async {
    try {
      await _firestore.collection('notes').add({
        'title': title,
        'description': description,
        'created_at': Timestamp.now(),
      });
      Get.snackbar('Success', 'Note added successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}