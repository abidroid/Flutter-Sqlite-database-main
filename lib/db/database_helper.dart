

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/student.dart';

class DatabaseHelper {
  // 1. Database creation
  // 2. Table(s) creation

  // database
  // singleton - single object
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // private
  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/chacha.db';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    // SQL query to create a table
    await db.execute('''Create TABLE tbl_student (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT NOT NULL,
                  course TEXT,
                  mobile TEXT UNIQUE,
                  totalFee INTEGER,
                  feePaid INTEGER
                   );
        ''');
  }



  // 3. method to save student
  Future<int> saveStudent( Student s ) async {

    Database db = await this.database;

    // table ma record insert lagay hain
    // int result = await db.rawInsert("""
    // INSERT INTO tbl_student ( name, course, mobile, totalFee, feePaid)
    // VALUES ( '${s.name}', '${s.course}', '${s.mobile}', ${s.totalFee},
    // ${s.feePaid});
    // """);

    // wrapper
    int result = await db.insert('tbl_student', s.toMap());
    return result; // positive value means record inserted
  }


  // 4. method to retrieve all students
 Future<List<Student>> getAllStudents() async {

    List<Student> students = [];
    // read records from table

    String query = 'Select * from tbl_student';
    Database db = await this.database;
    //var records = await db.rawQuery(query);
    var records = await db.query('tbl_student');
    for( var map in records){

      Student student = Student.fromMap(map);
      students.add(student);
    }

    return students;
 }


  // 5. method to update student
  Future<int> updateStudent( Student s) async {

    Database db = await this.database;

    //int result = await db.update('tbl_student', s.toMap(), where: 'id=?', whereArgs: [s.id!]);

    int result =  await db.rawUpdate('''
    UPDATE tbl_student set name=?, mobile=?, 
    course=?, totalFee=?, feePaid=? where
    id=?
    ''', [s.name, s.mobile, s.course, s.totalFee, s.feePaid, s.id]);
    return result;
  }


  // 6. method to delete student
  Future<int> deleteStudent(int id) async {

    Database db = await this.database;

    //int result = await db.rawDelete('Delete from tbl_student where id=?', [id]);

    int result = await db.delete('tbl_student', where: 'id=?', whereArgs: [id]);
    return result;
  }
}