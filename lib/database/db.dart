import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/contect_model.dart';

class DBHelper {

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  initDB() async {

    String path = join(await getDatabasesPath(), "contacts.db");

    return await openDatabase(
      path,
      version: 2,

      onCreate: (db, version) async {

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
      },

      onUpgrade: (db, oldVersion, newVersion) async {

        if (oldVersion < 2) {

          await db.execute("ALTER TABLE contacts ADD COLUMN address TEXT");
          await db.execute("ALTER TABLE contacts ADD COLUMN work TEXT");

        }

      },
    );
  }

  Future<int> insert(Contact contact) async {
    final db = await database;
    return db.insert("contacts", contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final db = await database;
    final res = await db.query("contacts");
    return res.map((e) => Contact.fromMap(e)).toList();
  }

  Future<int> update(Contact contact) async {
    final db = await database;

    return db.update(
      "contacts",
      contact.toMap(),
      where: "id=?",
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return db.delete("contacts", where: "id=?", whereArgs: [id]);
  }
}