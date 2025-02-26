import 'package:flutter/material.dart';
import 'package:project_one/database/controllers/user_controller.dart';
import 'package:project_one/models/process_response.dart';

import '../models/useer.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _lastnameTextController;
  late TextEditingController _firstNameTextController;
  bool _obscure = true;

  String? _emailErrorValue;
  String? _passwordErrorValue;
  String? _phoneErrorValue;
  String? _lastnameErrorValue;
  String? _firstNameErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _lastnameTextController = TextEditingController();
    _firstNameTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneTextController.dispose();
    _lastnameTextController.dispose();
    _firstNameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/sgn_in_screen');
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 8,),
              const Text('Create an account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF9391A4))),
              TextField(
                minLines: 2,
                maxLines: 2,
                controller: _firstNameTextController,
                onTap: () {},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'FullName',
                    errorText: _firstNameErrorValue),
              ),
              TextField(


                controller: _lastnameTextController,
                onTap: () {},
                minLines: 2,
                maxLines: 2,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(

                  // prefix: Icon(Icons.person),
                  labelText: 'Last name',
                  prefixIcon: const Icon(Icons.person),

                  errorText: _lastnameErrorValue,
                  errorMaxLines: 1,
                ),
              ),
              TextField(
                minLines: 1,
                maxLines: 1,
                controller: _emailTextController,
                onTap: () {},
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Email',
                    errorText: _emailErrorValue),
              ),
              TextField(
                onTap: () {},
                controller: _phoneTextController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: 'Phone',
                    errorText: _phoneErrorValue),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordTextController,
                obscureText: _obscure,
                onTap: () {},
                keyboardType: TextInputType.emailAddress,
                expands: false,
                decoration: InputDecoration(
                  labelText: 'Password',
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
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF6A90F2)),
                onPressed: () => performRegister(),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performRegister()async {
    if (checkData()) {
     await _register();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _lastnameTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _firstNameTextController.text.isNotEmpty) {
      return true;
    }

    setState(() {
      _emailErrorValue =
          _emailTextController.text.isNotEmpty ? 'Enter email' : null;
      _passwordErrorValue =
          _passwordTextController.text.isNotEmpty ? 'Enter password' : null;
      _lastnameErrorValue =
          _lastnameTextController.text.isNotEmpty ? 'Enter LastName ' : null;
      _firstNameErrorValue =
      _firstNameTextController.text.isNotEmpty ? 'Enter FirstName ' : null;
      _phoneErrorValue =
          _phoneTextController.text.isNotEmpty ? 'Enter phone ' : null;
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

  Future<void> _register() async{
    ProcessResponse processResponse= await UserController().saveRegister(user: user);
    print(processResponse.message);
    if(processResponse.success){
      Navigator.pushReplacementNamed(context, '/verify_screen');
    }

  }

  User get user{
    User user=User();
    user.firstname=_lastnameTextController.text;
    user.lastname=_lastnameTextController.text;
    user.email=_emailTextController.text;
    user.phone=_phoneTextController.text;
    user.password=_passwordTextController.text;
    return user;

  }
}
