class User{
  late int id;
  late String firstname;
  late String lastname;
  late String phone;
  late String email;
  late String password;

  User();

  static const String tableName= 'users';

  User.fromMap(Map<String,dynamic>rowMab){
    id=rowMab['id'];
    firstname=rowMab['firstname'];
    lastname=rowMab['lastname'];
    phone=rowMab['phone'];
    email=rowMab['email'];
    email=rowMab['password'];
  }


  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}