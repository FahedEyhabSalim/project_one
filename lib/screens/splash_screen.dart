import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_one/prefs/shared_pref_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  Future.delayed(const Duration(seconds: 3),(){
    bool loggedIn=SharedPrefController().getValueFor<bool>(Prefkeys.loggedIn.name) ?? false;
    String rout=loggedIn? '/bottom_navigation_screen' :'/sgn_in_screen';

    Navigator.pushReplacementNamed(context, rout);


  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:Stack(
        children: [
          SizedBox(height: 119,),
          Image(
            height: double.infinity,
            image: AssetImage('images/img.png'),
            fit: BoxFit.cover,
          ),
          SizedBox(height:19 ,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.h,vertical: 60.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/imge_2.png')),
                SizedBox(height: 10,),
                Text('FASHIONS',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Color(0xFF000000)),)

              ],
            ),
          )


        ],
      )
    );
  }
}
