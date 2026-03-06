import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/contect_model.dart';

class DBHelper {

  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {

    if (_database != null) return _database!;

    _database = await _initDB('contacts.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    await Directory(dbPath).create(recursive: true);

    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {

    await db.execute('''
      CREATE TABLE contacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phone TEXT,
        email TEXT,
        address TEXT,
        work TEXT,
        favorite INTEGER
      )
    ''');
  }

  Future<int> insert(Contact contact) async {

    final db = await instance.database;

    return await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contact>> getContacts() async {

    final db = await instance.database;

    final result = await db.query('contacts');

    return result.map((e) => Contact.fromMap(e)).toList();
  }

  Future<int> update(Contact contact) async {

    final db = await instance.database;

    return await db.update(
      'contacts',
      contact.toMap(),
      where: 'id=?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {

    final db = await instance.database;

    return await db.delete(
      'contacts',
      where: 'id=?',
      whereArgs: [id],
    );
  }

}