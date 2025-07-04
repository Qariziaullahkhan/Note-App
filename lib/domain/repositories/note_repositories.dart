import 'package:note_app/domain/models/note_model.dart';

abstract class NoteRepositories {
  Future<void> addNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNote(String id);
  Future<List<NoteModel>> getNotes();
}