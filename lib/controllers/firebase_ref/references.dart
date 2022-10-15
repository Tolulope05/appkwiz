import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
final CollectionReference questionPaperRF =
    firestore.collection('questionPapers');

DocumentReference questionRF({
  required String paperID,
  required String questionID,
}) =>
    questionPaperRF.doc(paperID).collection("questions").doc(questionID);
