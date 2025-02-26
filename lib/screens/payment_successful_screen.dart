import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  State<PaymentSuccessfulScreen> createState() => _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Image(image: AssetImage('images/Group 2.png')),
            const SizedBox(height: 14,),
             Text(AppLocalizations.of(context)!.payment_successful,style: TextStyle(fontSize: 25),),
            const SizedBox(height: 10,),
             Text(AppLocalizations.of(context)!.we_emailed,style: TextStyle(fontSize: 18,color: Color(0xFF8F8FA6))),
            const SizedBox(height: 40,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(260 , 47),
                  backgroundColor: const Color(0xFF6A90F2)),
              onPressed: () {

                Navigator.pushReplacementNamed(context, '/rate_order_screen');

              },
              child:  Text(
                AppLocalizations.of(context)!.finish,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )

          ],
        ),
      ),

    );
  }
}
