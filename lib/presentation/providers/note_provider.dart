import 'package:flutter/material.dart';
import 'package:note_app/data/repositories/note_repositories_impl.dart';
import 'package:note_app/domain/models/note_model.dart';

class NoteProvider with ChangeNotifier {
  final NoteRepositoriesImpl _noteRepository = NoteRepositoriesImpl();
  Stream <List<NoteModel>> get notes => _noteRepository.getNotes();

  Future<void> addNote(NoteModel note, String text) async {
    try {
      await _noteRepository.addNote(NoteModel(id: note.id, title: note.title, message: note.message));
    } catch (e) {
      print("Error adding note: $e");
      rethrow;
    }
  }
  Future<void> updateNote(NoteModel note) async {
    try {
      await _noteRepository.updateNote(NoteModel(id: note.id, title: note.title, message: note.message));
    } catch (e) {
      print("Error updating note: $e");
      rethrow;
    }
  }
  Future<void> deleteNote(String id) async {
    try {
      await _noteRepository.deleteNote(id);
    } catch (e) {
      print("Error deleting note: $e");
      rethrow;
    }
  }
}
