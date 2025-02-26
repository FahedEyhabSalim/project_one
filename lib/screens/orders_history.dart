import 'package:flutter/material.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({super.key});

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/rate_order_screen');
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          'Orders History',
          style: TextStyle(fontSize: 25, color: Color(0xFF474559)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              '3 Orders',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(image: AssetImage('images/Img_8.png')),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,


                            children: [
                              Text(
                                'Handbag',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF111111)),
                              ),
                              Text('from boots category',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFFA1A1B4))),
                              Text('\$100',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xFF111111))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 100,
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
                  );
                }),
          ],
        ),
      ),
    );
  }
}
