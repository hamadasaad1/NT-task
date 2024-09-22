import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/question_model.dart';

abstract class QuestionRemoteDataSource {
  Future<List<Question>> getQuestions();
  Future<List<Question>> getSearchQuestions({
    String? name,
    String? status,
  });

  Future<void> addQuestion(Question question);

  Future<void> addOrUpdateQuestion(Question question);

  Future<void> deleteQuestion(String questionId);

  Future<String> uploadImage(File image);
}

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  QuestionRemoteDataSourceImpl(this._firestore, this._firebaseStorage);

  // Fetch all questions from Firestore
  @override
  Future<List<Question>> getQuestions() async {
    final querySnapshot =
        await _firestore.collection('interview_questions').get();
    return querySnapshot.docs
        .map((doc) => Question.fromMap(doc.data()))
        .toList();
  }

  // Add a new question to Firestore
  @override
  Future<void> addQuestion(Question question) async {
    await _firestore.collection('interview_questions').add(question.toMap());
  }

  // Add or update a question in Firestore based on its existence
  @override
  Future<void> addOrUpdateQuestion(Question question) async {
    final docRef =
        _firestore.collection('interview_questions').doc(question.id);

    // Fetch the document snapshot
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // If the document exists, update it
      await docRef.update(question.toMap());
    } else {
      // If the document does not exist, create it
      await docRef.set(question.toMap());
    }
  }

  // Delete a question from Firestore by its ID
  @override
  Future<void> deleteQuestion(String questionId) async {
    await _firestore.collection('interview_questions').doc(questionId).delete();
  }

  // Upload an image to Firebase Storage and get the download URL
  @override
  Future<String> uploadImage(File image) async {
    // Create a reference to the Firebase Storage bucket
    final storageRef = _firebaseStorage
        .ref()
        .child('interview_questions/${image.path.split('/').last}');

    // Upload the file to Firebase Storage
    final uploadTask = await storageRef.putFile(image);

    // Get the download URL after the upload completes
    final downloadUrl = await uploadTask.ref.getDownloadURL();

    return downloadUrl;
  }

  @override
  Future<List<Question>> getSearchQuestions(
      {String? name, String? status}) async {
    final querySnapshot = await _firestore
        .collection('interview_questions')
        .where('name', isEqualTo: name)
        .where('status', isEqualTo: status)
        .get();
    return querySnapshot.docs
        .map((doc) => Question.fromMap(doc.data()))
        .toList();
  }
}
