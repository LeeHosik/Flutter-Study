import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_write/students.dart';

class DatabaseHandler {
  // Dao랑 비슷하다고 보면 된다.
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'student.db'),
      onCreate: (database, version) async {
        await database.execute(
          'create table students(id integer primary key autoincrement, code text, name text, dept text, phone text)',
        );
      },
      version: 1,
    );
  }

// ------
  Future<int> insertStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into students(code, name, dept, phone) values(?, ?, ?, ?)',
        [student.code, student.name, student.dept, student.phone]);

    return result;
  }

  Future<int> updateStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawUpdate(
        'update students set name = ?, dept = ?, phone = ? where id = ?',
        [student.name, student.dept, student.phone, student.id]);

    return result;
  }

  Future<int> deleteStudents(int id) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawDelete(
      'delete from students where id = ?',
      [id],
    );

    return result;
  }

  Future<int> deleteStudent(Students students) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawDelete(
      'delete from students where id = ?',
      [students.id],
    );

    return result;
  }

  Future<List<Students>> queryStudents() async {
    // DB 설정하기
    final Database db = await initializeDB();
    // KEY를 가지고와서 사용해야함.
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from students');
    return queryResult.map((e) => Students.formMap(e)).toList();
  }
} // END
