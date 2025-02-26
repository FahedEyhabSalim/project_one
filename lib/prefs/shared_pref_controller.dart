import 'package:project_one/models/useer.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum Prefkeys {language,email,name,loggedIn,password,phone,firstname,lastname}
class SharedPrefController{
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController(){
    return _instance??=SharedPrefController._();
  }

  Future<void> initPreferences()async{

    _sharedPreferences= await SharedPreferences.getInstance();
  }

  void changeLanguage({required String langCode}){
    _sharedPreferences.setString(Prefkeys.language.name, langCode);
  }

  // String get language=>_sharedPreferences.getString(Prefkeys.language.name)??'en';
  // bool get loggedIn=> _sharedPreferences.getBool(Prefkeys.loggedIn.name)??false;

  void saveLogin({required User  user}){
    _sharedPreferences.setBool(Prefkeys.loggedIn.name,true);
    _sharedPreferences.setString(Prefkeys.email.name,user.email);
  }


  void saveRegister({required User  user}){
    _sharedPreferences.setBool(Prefkeys.loggedIn.name,true);
    _sharedPreferences.setString(Prefkeys.email.name,user.email);
    _sharedPreferences.setString(Prefkeys.firstname.name,user.firstname);
    _sharedPreferences.setString(Prefkeys.lastname.name,user.lastname);
    _sharedPreferences.setString(Prefkeys.phone.name,user.phone);
    _sharedPreferences.setString(Prefkeys.password.name,user.password);

  }
  T?getValueFor<T>(String key){
    if (_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;

    }
    return null;

  }


  Future<bool> removeValueFor( String key)async{
    if (_sharedPreferences.containsKey(key)){
      return _sharedPreferences.remove(key);
    }

    return false;


  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }



}


