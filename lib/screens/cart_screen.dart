import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(AppLocalizations.of(context)!.cart),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10.h,),

             Text(
              '3 items available',
              style: TextStyle(fontSize: 18.sp),
            ),
             // SizedBox(height: 10.h),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100.h,
                    margin:
                        EdgeInsetsDirectional.only(bottom: index == 5 ? 0 : 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: const [
                      //   BoxShadow(
                      //     offset: Offset(0,0),
                      //     color: Colors.black,
                      //     blurRadius: 6,
                      //   ),
                      // ]
                    ),
                    child: Row(
                      children: [
                        const Image(image: AssetImage('images/Img_8.png')),
                         Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            children: [
                              Text(
                                'Handbag',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Color(0xFF111111)),
                              ),
                              Text('from boots category',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Color(0xFFA1A1B4))),
                              Text('\$100',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Color(0xFF111111))),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),

                        Row(
                          children: [


                            IconButton(
                              onPressed: () {
                                setState(() {
                                  ++_counter;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                            Text(
                              _counter.toString(),
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  --_counter;
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(height: 48.h,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Sub total:'),
                  Spacer(),
                  Text('\$100'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Tax(15%):'),
                  Spacer(),
                  Text('\$15',style: TextStyle(fontSize: 15,color: Color(0xFF232323)),),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Total:'),
                  Spacer(),
                  Text('\$215',style: TextStyle(fontSize: 20,color: Color(0xFF232323)),),
                ],
              ),
            ),
             SizedBox(
              height: 10.h,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF6A90F2)),
              onPressed: () {
                Navigator.pushNamed(context, '/payment_mode_screen');
              },
              child:  Text(
                AppLocalizations.of(context)!.checkout,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFFFFFFFF)),
              onPressed: () {
                Navigator.pushNamed(context, '/cancel_orders_screen');
              },
              child:  Text(
                AppLocalizations.of(context)!.cancel_order,
                style: TextStyle(color: Color(0xFF474459), fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
