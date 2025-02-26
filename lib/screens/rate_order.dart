import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class RateOrderScreen extends StatefulWidget {
  const RateOrderScreen({super.key});

  @override
  State<RateOrderScreen> createState() => _RateOrderScreenState();
}

class _RateOrderScreenState extends State<RateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(textAlign: TextAlign.center,'How was your orderexperiences from it Momma?',style: TextStyle(fontSize: 25),),
      SizedBox(height: 32,),
      RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.blue,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
          const SizedBox(height: 32,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(315, 50),
                backgroundColor: const Color(0xFF6A90F2)
            ),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/orders_history_screen');
            },


            child: const Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 20),),
            
          ),
          SizedBox(height: 10,),

          Center(
            child: RichText(
                text: TextSpan(
                    text: '',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF9391A4),
                    ),
                    children: [
                      const TextSpan(text: ' '),
                      TextSpan(
                          text: 'Not now!',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,

                              fontSize: 18,
                              color: Colors.black))
                    ])),
          )

        ],
      ),
    );
  }
}
