import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/question_model.dart';

abstract class QuestionLocalDataSource {
  Future<List<Question>> getAllQuestions();
  Future<List<Question>> getSearchQuestions({
    String? name,
    String? status,
  });

  Future<void> saveAllQuestions(List<Question> questions);

  Future<void> saveOrUpdateQuestion(Question question);

  Future<void> saveToAllQuestions(Question question);

  Future<List<Question>> getAddOrUpdatedQuestions();

  Future<void> saveDeleteItemQuestion(String questionId);

  Future<void> deleteItemFromAllSaved(String questionId);

  Future<void> deleteItemFromAllUpdated(String questionId);

  Future<List<String>> getDeletedQuestions();

  Future<void> deleteUpdatedListQuestions();

  Future<void> deleteListDeletedItemQuestions();
}

class QuestionLocalDataSourceImpl implements QuestionLocalDataSource {
  static final QuestionLocalDataSourceImpl _instance =
      QuestionLocalDataSourceImpl._internal();

  factory QuestionLocalDataSourceImpl() {
    return _instance;
  }

  QuestionLocalDataSourceImpl._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'questions.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Create the tables for interview questions
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE all_questions (
        id TEXT PRIMARY KEY,
        name TEXT,
        status TEXT,
        example TEXT

      )
    ''');

    await db.execute('''
      CREATE TABLE updated_questions (
        id TEXT PRIMARY KEY,
        name TEXT,
        status TEXT,
        example TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE deleted_questions (
        id TEXT PRIMARY KEY
      )
    ''');
  }

  // Save all questions
  @override
  Future<void> saveAllQuestions(List<Question> questions) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('all_questions'); // Clear existing data
      for (var question in questions) {
        await txn.insert('all_questions', question.toMap());
      }
    });
  }

  // Get all questions
  @override
  Future<List<Question>> getAllQuestions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('all_questions');
    return List.generate(maps.length, (i) {
      return Question.fromMap(maps[i]);
    });
  }

  // Save or update a question in the updated list
  @override
  Future<void> saveOrUpdateQuestion(Question question) async {
    final db = await database;
    await db.insert(
      'updated_questions',
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all added or updated questions
  @override
  Future<List<Question>> getAddOrUpdatedQuestions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('updated_questions');
    return List.generate(maps.length, (i) {
      return Question.fromMap(maps[i]);
    });
  }

  // Save a deleted question by its ID
  @override
  Future<void> saveDeleteItemQuestion(String questionId) async {
    final db = await database;
    await db.insert('deleted_questions', {'id': questionId});
  }

  // Get all deleted questions
  @override
  Future<List<String>> getDeletedQuestions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('deleted_questions');
    return List.generate(maps.length, (i) {
      return maps[i]['id'] as String;
    });
  }

  // Delete all items from deleted questions
  @override
  Future<void> deleteListDeletedItemQuestions() async {
    final db = await database;
    await db.delete('deleted_questions');
  }

  // Delete all items from the updated list
  @override
  Future<void> deleteUpdatedListQuestions() async {
    final db = await database;
    await db.delete('updated_questions');
  }

  // Delete an item from the saved questions list
  @override
  Future<void> deleteItemFromAllSaved(String questionId) async {
    final db = await database;
    await db.delete('all_questions', where: 'id = ?', whereArgs: [questionId]);
  }

  // Delete an item from the updated questions list
  @override
  Future<void> deleteItemFromAllUpdated(String questionId) async {
    final db = await database;
    await db
        .delete('updated_questions', where: 'id = ?', whereArgs: [questionId]);
  }

  // Save a question to the all questions list
  @override
  Future<void> saveToAllQuestions(Question question) async {
    final db = await database;
    await db.insert(
      'all_questions',
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Question>> getSearchQuestions(
      {String? name, String? status}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('all_questions',
        where: 'name LIKE ? AND status LIKE ?',
        whereArgs: ["%$name%", "%$status%"]);
    return List.generate(maps.length, (i) {
      return Question.fromMap(maps[i]);
    });
  }
}
