import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/tips_model.dart';

abstract class TipLocalDataSource {
  Future<List<Tip>> getAllTips();
  Future<List<Tip>> getSearchTips({
    String? content,
  });
  Future<void> saveAllTips(List<Tip> tips);
  Future<void> saveOrUpdateTip(Tip tip);
  Future<void> saveToAllTips(Tip tip);
  Future<List<Tip>> getAddOrUpdatedTips();
  Future<void> deleteTip(String tipId);
}

class TipLocalDataSourceImpl implements TipLocalDataSource {
  static final TipLocalDataSourceImpl _instance =
      TipLocalDataSourceImpl._internal();

  factory TipLocalDataSourceImpl() {
    return _instance;
  }

  TipLocalDataSourceImpl._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'tips.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Create the tables for interview tips
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE all_tips (
        id TEXT PRIMARY KEY,
        content TEXT,
        advancedStrategy TEXT
      )
    ''');
  }

  // Save all tips
  @override
  Future<void> saveAllTips(List<Tip> tips) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('all_tips'); // Clear existing data
      for (var tip in tips) {
        await txn.insert('all_tips', tip.toMap());
      }
    });
  }

  // Get all tips
  @override
  Future<List<Tip>> getAllTips() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('all_tips');
    return List.generate(maps.length, (i) {
      return Tip.fromMap(maps[i]);
    });
  }

  // Save or update a tip
  @override
  Future<void> saveOrUpdateTip(Tip tip) async {
    final db = await database;
    await db.insert(
      'all_tips',
      tip.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all added or updated tips (currently the same as all tips)
  @override
  Future<List<Tip>> getAddOrUpdatedTips() async {
    return await getAllTips();
  }

  // Delete a tip by its ID
  @override
  Future<void> deleteTip(String tipId) async {
    final db = await database;
    await db.delete('all_tips', where: 'id = ?', whereArgs: [tipId]);
  }

  // Search tips by content
  @override
  Future<List<Tip>> getSearchTips({String? content}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'all_tips',
      where: 'content LIKE ?',
      whereArgs: ["%$content%"],
    );
    return List.generate(maps.length, (i) {
      return Tip.fromMap(maps[i]);
    });
  }

  @override
  Future<void> saveToAllTips(Tip tip) {
    throw UnimplementedError();
  }
}
