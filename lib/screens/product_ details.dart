import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/bottom_navigation_screen');
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Product Details',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Container(
            // Image.asset('images/imag_6.png'),
            width: 300,
            height: 300,
            child: const Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Icon(Icons.favorite,color: Colors.red,),
                  ],
                ),
                Image(image: AssetImage('images/imag_6.png'),width: 200,height: 200,),
                Row(
                  children: [
                    Text('Handbag',style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Text('\$125',style: TextStyle(fontSize: 18),),
                  ],
                ),


              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              child: const Text(
                  'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type andscrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been theindustry’s standard dummy text ever since the 1500s,when an unknown printer took a galley of type andscrambled it to make a type specimen book.'),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A90F2),
                minimumSize: const Size(double.infinity, 50)),
            onPressed: () {
              Navigator.pushNamed(context, '/cart_screen');
            },
            child: const Text(
              'ADD TO CART',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
