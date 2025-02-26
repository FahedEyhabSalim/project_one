import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/sign_up_screen');
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Verify Your Account',
              style: TextStyle(fontSize: 25, color: Color(0xFF23203F))),
          const Text(
            textAlign: TextAlign.center,
            'We are sending OTP to validate yourmobile number. Hang on!',
            style: TextStyle(fontSize: 18, color: Color(0xFF9192AE)),
          ),

          SizedBox(height:36 ,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [

                SizedBox(width: 24,),

                Expanded(
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    maxLength: 1,

                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                        minHeight: 50,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 24,),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    maxLength: 1,

                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                        minHeight: 50,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),


                SizedBox(width: 24,),

                Expanded(
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    maxLength: 1,

                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                        minHeight: 50,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      errorMaxLines: 1,
                    ),
                  ),
                ),

                SizedBox(width: 24,),

                Expanded(
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    maxLength: 1,

                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                        minHeight: 50,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      errorMaxLines: 1,
                    ),
                  ),
                ),
              ],

            ),
          ),
          SizedBox(height: 26,),
          const Text(
            'SMS has been sent to 1800 123 4567',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 43,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A90F2),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
