import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:measure_ap/models/new_assessment.dart';

class AssessmentRepository {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  final CollectionReference assessmentRef =
      _firebaseFirestore.collection("assessment");

  Future<void> addAssessmentResult(
      BaseAssessment assessment, Map<String, bool> result) async {
    try {
      Map<String, dynamic> combinedMap = {
      ...assessment.toMap(),
      'results': result,
    };
      await assessmentRef.add(combinedMap);
    } catch (e) {
      print(e);
    }
  }
}
