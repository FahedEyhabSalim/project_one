import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/sgn_in_screen');
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 165,),
            Text('Reset Password',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Enter your email to reset password',style: TextStyle(fontSize: 18),),
            SizedBox(height: 33,),
            TextField(
              minLines: 1,
              maxLines: 1,
              onTap: () {},
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(315, 50),
                  backgroundColor: const Color(0xFF6A90F2)),
              onPressed: (){},
              child: const Text(
                'Reset',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )


          ],
        ),
      ),
    );
  }
}
