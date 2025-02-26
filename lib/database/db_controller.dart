

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController{
  DbController._();

  late Database _database;
  static DbController? _instance;


  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database=>_database;

  Future<void> intiDatabase()async{
   Directory directory = await getApplicationCacheDirectory();
   String path=join(directory.path,'app_db_sql');
    _database =await openDatabase(
      path,
        version: 1,
        onOpen: (Database database){},
        onCreate: (Database database,int version)async{
        await database.execute('CREATE TABLE users('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'firstname  TEXT NOT NULL,'
            'lastname  TEXT NOT NULL,'
            'phone  TEXT NOT NULL,'
            'email TEXT NOT NULL ,'
            'password TEXT NOT NULL '
            ' )');
        // await database .execute('CREATE TABLE product('
        //       'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        //       'name TEXT NO NULL,'
        //       'info TEXT NO NULL,'
        //       'price REAL,'
        //       'quantity INTEGER DEFAULT(0),'
        //       'user_id INTEGER'
        //       'FOREIGN KYE(user_id) references users(id)'
        //
        //       ')');
        //
        // await database .execute('CREATE TABLE cart('
        //     'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        //     'total REAL NOT NULL ,'
        //     'count INTEGER NOT NULL,'
        //     'price REAL NOT NULL,'
        //     'user_id INTEGER,'
        //     'product_id INTEGER,'
        //     'FOREIGN KYE(user_id) references users(id)'
        //     'FOREIGN KYE(product_id) references products(id)'
        //     ')');

        },
        onUpgrade: (Database database ,int oldVersion,int newVersion){},
        onDowngrade: (Database database ,int oldVersion,int newVersion){},


    );


  }

}