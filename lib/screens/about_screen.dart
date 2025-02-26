import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/more_screen');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
        body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            const Image(image: AssetImage('images/imge_2.png')),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'FASHIONS',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF000000)),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(),
            Align(
              alignment:AlignmentDirectional.topStart,
              child: Text(
                'About',
                style: TextStyle(fontSize: 25.sp),
              ),
            ),
            const Text(
              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical professor.',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Divider(),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: const Row(
                children: [
                  Image(image: AssetImage('images/Clip.png')),
                  Image(image: AssetImage('images/Clip2.png')),
                ],
              ),
            ),
             SizedBox(
              height: 10.h,
            ),
            const Image(image: AssetImage('images/clip3.png'))
          ],
        ),
      ),
    );
  }
}
