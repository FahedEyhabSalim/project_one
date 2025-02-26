import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_one/prefs/shared_pref_controller.dart';
import 'package:project_one/provider/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:project_one/prefs/shared_pref_controller.dart';

import '../database/controllers/user_controller.dart';
import '../models/process_response.dart';
import '../models/useer.dart';


class SigIn extends StatefulWidget {
  const SigIn({super.key});

  @override
  State<SigIn> createState() => _SigInState();
}

class _SigInState extends State<SigIn> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  bool _obscure = true;

  late TapGestureRecognizer _tapGestureRecognizer;
  late TapGestureRecognizer _tapGestureRecognizer2;
  String? _emailErrorValue;
  String? _passwordErrorValue;
  late String _language ;

  @override
  void initState() {
    // TODO: implement initState
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createNewAccountActions;
    _tapGestureRecognizer2 = TapGestureRecognizer()..onTap = ResetPassword;
    _language =SharedPrefController().getValueFor(Prefkeys.language.name)??"en";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _tapGestureRecognizer.dispose();
    _tapGestureRecognizer2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _showLanguageBottomSheet();
              },
              icon: Icon(Icons.language))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.sign_in,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              AppLocalizations.of(context)!.login_to_start_using_app,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 36,
            ),
            TextField(
              minLines: 1,
              maxLines: 1,
              controller: _emailTextController,
              onTap: () {},
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                errorText: _emailErrorValue,
                labelText: AppLocalizations.of(context)!.email,
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            TextField(
              controller: _passwordTextController,
              obscureText: _obscure,
              onTap: () {},
              keyboardType: TextInputType.emailAddress,
              expands: false,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
                errorText: _passwordErrorValue,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => _obscure = !_obscure);
                    },
                    icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off)),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A90F2),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () => performLogin(),
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: AppLocalizations.of(context)!.don_have_an_account,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF9391A4),
                      ),
                      children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                        recognizer: _tapGestureRecognizer,
                        text: AppLocalizations.of(context)!.sign_up,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ])),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: '',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF9391A4),
                          ),
                          children: [
                        const TextSpan(text: ''),
                        TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: AppLocalizations.of(context)!.reset_password,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      _login();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    setState(() {
      _emailErrorValue =
          _emailTextController.text.isNotEmpty ? 'Enter email' : null;
      _passwordErrorValue =
          _passwordTextController.text.isNotEmpty ? 'Enter password' : null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enter , enter required data!'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
    return false;
  }

  void createNewAccountActions() {
    Navigator.pushNamed(context, '/sign_up_screen');
  }

  void ResetPassword() {
    Navigator.pushNamed(context, '/sign_up_screen');
  }




  Future<void> _login() async{
    ProcessResponse processResponse= await UserController().login(
        email: _emailTextController.text,
        password: _passwordTextController.text
    );
    if(processResponse.success){

      Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');

    }

  }

  User get user{
    User user=User();
    user.email=_emailTextController.text;
    user.password=_passwordTextController.text;
    return user;

  }
  void _showLanguageBottomSheet() async{
   String? langCode = await showModalBottomSheet<String>(
        context: context,
        builder: (context) {
          return BottomSheet(
            backgroundColor: Colors.white,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            onClosing: () {},
            builder: (context) {
              return StatefulBuilder(builder: (context,setState){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language_title,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        AppLocalizations.of(context)!.language_sub_title,
                        style: TextStyle(fontSize: 13.sp, color: Colors.black45),
                      ),
                      Divider(),
                      RadioListTile<String>(
                          title: Text('English'),
                          value: _language,
                          groupValue: 'en',
                          onChanged: (String? value) {
                            if(value!=null)
                              setState(() =>_language=value);
                            Navigator.pop(context,'en');
                          }),

                      RadioListTile<String>(
                          title: Text('العربية'),
                          value: 'ar',
                          groupValue: _language,
                          onChanged: (String? value) {
                            if(value!=null)
                              setState(() =>_language=value);
                            Navigator.pop(context,'ar');
                          })
                    ],
                  ),
                );
              });
            },
          );
        });

   if(langCode !=null){
     Provider.of<LanguageProvider>(context,listen: false  ).changeLanguage();


   }
  }
}
