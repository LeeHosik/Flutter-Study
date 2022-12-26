import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_write/students.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    print('future<databas> initializeDB #1');
    String path = await getDatabasesPath();
    print("DatabaseHandler's initializeDB access $initializeDB()");
    return openDatabase(
      join(path, 'student.db'),
      onCreate: (database, version) async {
        //print(database);
        await database.execute(
            'create table student (id integer primary key autoincrement, code text, name text, dept text, phone text, address text)');
      }, //없으면 만들고 있으면 넘김
      version: 1,
    );
  }

  Future<int> insertStudents(Students students) async {
    int result = 0;

    final Database db = await initializeDB();
    print("insertStudents Database's DB $db");
    result = await db.rawInsert(
        'insert into student (code, name, dept, phone, address) value (?,?,?,?,?)',
        [
          students.code,
          students.name,
          students.dept,
          students.phone,
          students.address
        ]);
    return result;
  } // insertStudents END

  Future<List<Students>> queryStudents() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from student');
    return queryResult.map((e) => Students.fromMap(e)).toList();
  } // queryStudent END

} // DatabaseHandler END
