import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/domain/models/note_model.dart';

class NoteRepositoriesImpl {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addNote(NoteModel note) async {
    try {
      await firestore.collection('notes').add(note.toJson());
    } catch (e) {
      print("Error adding note: $e");
      rethrow;
    }
  }

  Future<void>updateNote(NoteModel note)async{
    try{
      await firestore.collection('notes').doc(note.id).update(note.toJson());
    }catch(e){
      print("Error updating note: $e");
      rethrow;
    }
  }
  Future<void> deleteNote(String id) async {
    try {
      await firestore.collection('notes').doc(id).delete();
    } catch (e) {
      print("Error deleting note: $e");
      rethrow;
    }
  }
 Stream<List<NoteModel>> getNotes() {
    return firestore.collection('notes').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => NoteModel.fromjson(doc.data(), doc.id))
          .toList();
    });
  }
}