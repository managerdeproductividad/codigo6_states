import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  Future<List<Map>> getNotes() async {
    CollectionReference notesReferences =
        FirebaseFirestore.instance.collection("notes");
    QuerySnapshot collection = await notesReferences.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<Map> notes = [];
    for (var item in docs) {
      Map note = item.data() as Map;
      note["id"] = item.id;
      notes.add(note);
    }
    return notes;
  }

  void  updateNote(String id) {
    CollectionReference notesReferences =
        FirebaseFirestore.instance.collection("notes");
    notesReferences.doc(id).update(
      {
        "status": true,
      },
    );
  }
}
