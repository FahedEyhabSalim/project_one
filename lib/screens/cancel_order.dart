import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('images/cancel.png')),
               SizedBox(
                height: 10.h,
              ),
               Text(
                textAlign: TextAlign.center,
                'Are you sure you wantto cancel this order?',
                style: TextStyle(fontSize: 25.sp),
              ),
               SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A90F2),
                    minimumSize:  Size(267.w, 50.h),
                  ),
                  onPressed: () {},
                  child:  Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  )),
               SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize:  Size(267.w, 50.h),
                  ),
                  onPressed: () {},
                  child:  Text(
                    'Not Now!',
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
