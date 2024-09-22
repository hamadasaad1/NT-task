import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/features/home/domain/model/meal_entity.dart';

import 'app/my_app.dart';
import 'app/network/bloc_observe.dart';
import 'app/service_locator.dart';
import 'features/travel/data/models/travel_destination.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  Hive.registerAdapter(MealEntityAdapter());
  Hive.registerAdapter(TravelDestinationAdapter());
  await initAppModule();
  Bloc.observer = MyBlocObserver();

  runApp(ProviderScope(child: MyApp()));
}
