import 'package:project_one/database/db_controller.dart';
import 'package:project_one/models/process_response.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/useer.dart';
import '../../prefs/shared_pref_controller.dart';

class UserController {
  final Database _database = DbController().database;

  Future<ProcessResponse> login(
      {required String email, required String password}) async {
    List<Map<String, dynamic>> rowsMap = await _database.query(
      User.tableName,
      where: 'email=? AND password=?',
      whereArgs: [email, password],
    );

    if (rowsMap.isNotEmpty) {
      User user = User.fromMap(rowsMap.first);
      SharedPrefController().saveLogin(user: user);
      return ProcessResponse(message: 'Logged in successfully', success: true);
    }
    return ProcessResponse(message: 'Credentials error, check and try again!');
  }

  Future<ProcessResponse> saveRegister({required User user}) async {
    // FIRST: RAW INSERT (SQL)
    // int newRowId= await _database.rawInsert('INSERT INTO USER(name,email,password)VALUES(?,?,?)',
    //      [user.name ,user.email,user.password]);

    if (await _isUniqueExist(
        email: user.email,
        phone: user.phone,
        firstname: user.firstname,
        lastname: user.lastname)) {
      int newRowId = await _database.insert(User.tableName, user.toMap());
      return ProcessResponse(
          message: newRowId != 0 ? 'Register successfully' : 'Register failed!',
          success: newRowId != 0);
    } else {
      return ProcessResponse(
        message: 'Email exist,use another',
        success: false,
      );
    }
  }

  Future<bool> _isUniqueExist({
    required String email,
    required String phone,
    required String firstname,
    required String lastname,
  }) async {
    List<Map<String, dynamic>> rowsMap =
        await _database.rawQuery('SELECT *FROM users WHERE email=?', [email]);

    return rowsMap.isEmpty;
  }
}
