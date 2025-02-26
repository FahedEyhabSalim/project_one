import 'package:flutter/cupertino.dart';
import 'package:project_one/prefs/shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier{
String language = SharedPrefController().getValueFor<String>(Prefkeys.language.name)??'en';


void changeLanguage(){
  language =language=='en'?'ar':'en';

  SharedPrefController().changeLanguage(langCode: language);
  notifyListeners();
}

}