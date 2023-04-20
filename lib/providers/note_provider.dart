import 'package:codigo6_states/services/remote/firestore_service.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier{
  FirestoreService firestoreService = FirestoreService();

  List<Map> notes = [];
  getNotes() async{
    notes = await firestoreService.getNotes();
    notifyListeners();
  }

  updateNote(String id){
    firestoreService.updateNote(id);
    getNotes();
  }
}