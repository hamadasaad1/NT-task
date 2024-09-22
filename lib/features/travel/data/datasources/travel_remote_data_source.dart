import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:template/app/constants.dart';

import '../models/travel_destination.dart';

abstract class TravelRemoteDataSource {
  Future<List<TravelDestination>> getTravelDestinations();

  Future<void> addTravelDestination(TravelDestination destination);

  Future<void> addOrUpdateTravelDestination(TravelDestination destination);

  Future<void> deleteTravelDestination(String destinationId);

  Future<String> uploadImage(File image);
}

class TravelRemoteDataSourceImpl implements TravelRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  TravelRemoteDataSourceImpl(this._firestore, this._firebaseStorage);

  @override
  Future<List<TravelDestination>> getTravelDestinations() async {
    final querySnapshot =
        await _firestore.collection(Constants.travelDestinationsKey).get();
    return querySnapshot.docs
        .map((doc) => TravelDestination.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<void> addTravelDestination(TravelDestination destination) async {
    await _firestore
        .collection(Constants.travelDestinationsKey)
        .add(destination.toJson());
  }

  @override
  Future<void> addOrUpdateTravelDestination(
      TravelDestination destination) async {
    final docRef = _firestore
        .collection(Constants.travelDestinationsKey)
        .doc(destination.id);

    // Fetch the document snapshot
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // If the document exists, update it
      await docRef.update(destination.toJson());
    } else {
      // If the document does not exist, create it
      await docRef.set(destination.toJson());
    }
  }

  @override
  Future<void> deleteTravelDestination(String destinationId) async {
    await _firestore
        .collection(Constants.travelDestinationsKey)
        .doc(destinationId)
        .delete();
  }

  @override
  Future<String> uploadImage(File image) async {
    // Create a reference to the Firebase Storage bucket
    final storageRef = _firebaseStorage.ref().child(
        '${Constants.travelDestinationsKey}/${image.path.split('/').last}');

    // Upload the file to Firebase Storage
    final uploadTask = await storageRef.putFile(image);

    // Get the download URL after the upload completes
    final downloadUrl = await uploadTask.ref.getDownloadURL();

    return downloadUrl;
  }
}
