import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference<Map<String, dynamic>> questionPaperRF =
    firestore.collection('questionPapers');

DocumentReference questionRF({
  required String paperID,
  required String questionID,
}) =>
    questionPaperRF.doc(paperID).collection("questions").doc(questionID);
Reference get firebaseStorage => FirebaseStorage.instance.ref();

final userRF = firestore.collection("users");
