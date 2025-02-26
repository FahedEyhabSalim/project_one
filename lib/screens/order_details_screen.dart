import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Order Details',style: TextStyle(fontSize: 25),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/orders_history_screen');
        }, icon: Icon(Icons.arrow_back_ios)),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            Text('3 items available',style: TextStyle(fontSize: 18),),

            SizedBox(height: 12,),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return Container(
                    child:  Row(
                      children: [
                        Image(image: AssetImage('images/Clip4.png')),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text('Handbag',style: TextStyle(fontSize: 16,color: Color(0xFF111111)),),
                              Text('from boots category',style: TextStyle(fontSize: 14,color: Color(0xFFA1A1B4))),
                              Text('\$100',style: TextStyle(fontSize: 15,color: Color(0xFF111111))),

                            ],
                          ),
                        ),

                      ],
                    ),
                    height: 100,
                    margin: EdgeInsetsDirectional.only(bottom: index== 5?0:15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0,0),
                          color: Colors.black,
                          blurRadius: 6,
                        ),
                      ]
                    ),
                  );
                }),



            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Row(
                    children: [
                      Text('Sub total:'),
                      Spacer(),
                      Text('\$100'),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Tax(15%):'),
                      Spacer(),
                      Text('\$15'),
                    ],
                  ),

                  Divider(),

                  Row(
                    children: [
                      Text('Total:'),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(79, 50),
                            backgroundColor: const Color(0xFF6A90F2)),
                        onPressed: () {},
                        child: const Text(
                          '\$215',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
