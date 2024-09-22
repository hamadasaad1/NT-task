import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import '../models/travel_destination.dart';

abstract class TravelLocalDataSource {
  Future<List<TravelDestination>> getAllTravelDestinations();

  Future<void> saveAllTravelDestinations(List<TravelDestination> destinations);

  Future<void> saveOrUpdateTravelDestination(TravelDestination destination);

  Future<void> saveToAllTravelDestination(TravelDestination destination);

  Future<List<TravelDestination>> getAddOrUpdatedTravelDestinations();

  Future<void> saveDeleteItemTravelDestination(String destination);

  Future<void> deleteItemFormAllSaved(String destination);

  Future<void> deleteItemFormAllUpdated(String destination);

  Future<List<String>> getDeletedTravelDestinations();

  Future<void> deleteUpdatedListTravel();

  Future<void> deleteListDeletedItemTravel();
}

class TravelLocalDataSourceImpl implements TravelLocalDataSource {
  static const String allTravelBoxName = 'all_travel_destinations';
  static const String updatedTravelBoxName = 'updated_travel_destinations';
  static const String deletedTravelBoxName = 'deleted_travel_destinations';

  TravelLocalDataSourceImpl() {
    _initHive();
  }

  Future<void> _initHive() async {
    final appDocumentDir =
        await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(
          TravelDestinationAdapter()); // Register the adapter for TravelDestination
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(PermissionsAdapter());
    }
  }

  @override
  Future<void> saveAllTravelDestinations(
      List<TravelDestination> destinations) async {
    final box = await Hive.openBox<TravelDestination>(allTravelBoxName);
    await box.clear(); // Clear existing data
    await box.addAll(destinations);
  }

  @override
  Future<List<TravelDestination>> getAllTravelDestinations() async {
    await delay();
    final box = await Hive.openBox<TravelDestination>(allTravelBoxName);
    return box.values.toList();
  }

  @override
  Future<void> saveOrUpdateTravelDestination(
      TravelDestination destination) async {
    await delay();
    final box = await Hive.openBox<TravelDestination>(updatedTravelBoxName);
    var listItems = box.values.toList();

    int index = listItems.indexWhere((element) => element.id == destination);
    if (index >= 0) {
      await box.put(listItems[index].id, destination);
    } else {
      await box.add(destination);
    }
  }

  @override
  Future<List<TravelDestination>> getAddOrUpdatedTravelDestinations() async {
    final box = await Hive.openBox<TravelDestination>(updatedTravelBoxName);
    return box.values.toList();
  }

  @override
  Future<List<String>> getDeletedTravelDestinations() async {
    final box = await Hive.openBox<String>(deletedTravelBoxName);
    return box.values.toList();
  }

  @override
  Future<void> saveDeleteItemTravelDestination(String destination) async {
    final box = await Hive.openBox<String>(deletedTravelBoxName);
    await box.add(destination);
  }

  @override
  Future<void> deleteListDeletedItemTravel() async {
    final box = await Hive.openBox<String>(deletedTravelBoxName);

    await box.clear();
  }

  @override
  Future<void> deleteUpdatedListTravel() async {
    final box = await Hive.openBox<TravelDestination>(updatedTravelBoxName);
    await box.deleteAll(box.keys.toList());
  }

  @override
  Future<void> deleteItemFormAllSaved(String destination) async {
    await delay();
    final box = await Hive.openBox<TravelDestination>(allTravelBoxName);
    var listItems = box.values.toList();

    int index = listItems.indexWhere((element) => element.id == destination);
    if (index >= 0) {
      await box.deleteAt(index);
    }
  }

  @override
  Future<void> deleteItemFormAllUpdated(String destination) async {
    final box = await Hive.openBox<TravelDestination>(updatedTravelBoxName);
    var listItems = box.values.toList();

    int index = listItems.indexWhere((element) => element.id == destination);
    if (index >= 0) {
      await box.deleteAt(index);
    }
  }

  @override
  Future<void> saveToAllTravelDestination(TravelDestination destination) async {
    await delay();
    final box = await Hive.openBox<TravelDestination>(allTravelBoxName);
    var listItems = box.values.toList();

    int index = listItems.indexWhere((element) => element.id == destination.id);
    if (index >= 0) {
      await box.deleteAt(index);
      await box.add(destination);
    } else {
      await box.add(destination);
    }
  }

  delay() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
