import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({super.key});

  @override
  State<PaymentMode> createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {
  late TextEditingController _nauberTextController;
  late TextEditingController _MMYYTextController;
  late TextEditingController _CCVTextController;

  String? _nauberErrorValue;
  String? _MMYYErrorValue;
  String? _CCVErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nauberTextController = TextEditingController();
    _MMYYTextController = TextEditingController();
    _CCVTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nauberTextController.dispose();
    _MMYYTextController.dispose();
    _CCVTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_screen');
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: const Text(
          'Payment mode',
          style: TextStyle(
              fontSize: 22,
              color: Color(0xFF474559),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 214,
                width: 336,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage('images/Path 26.png')),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '1234 5678 9876 5432',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '1234',
                        style: TextStyle(color: Color(0xFFC7C7C7), fontSize: 14),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text(
                            'James Born',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            'EXPIRY',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '03/17',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C8EF2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: _nauberTextController,
                maxLength: 10,
                onTap: () {},
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  hintText: '6524 2541 2164',
                  errorText: _nauberErrorValue
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onTap: () {},
                controller: _MMYYTextController,
                maxLength: 10,

                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  hintText: 'MM/YY',
                  errorText: _MMYYErrorValue
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onTap: () {},
                maxLength: 10,
                controller: _CCVTextController,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  hintText: 'CCV',
                  errorText: _CCVErrorValue
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF7530FF)),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/payment_successful_screen');

                },
                child:  Text(
                  AppLocalizations.of(context)!.proceed,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
