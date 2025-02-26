import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _kendrickTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _lastNameTextController;

  String? _emailErrorValue;
  String? _phoneErrorValue;
  String? _lastNameErrorValue;
  String? _kendrickErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _kendrickTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _lastNameTextController = TextEditingController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTextController.dispose();
    _kendrickTextController.dispose();
    _phoneTextController.dispose();
    _lastNameTextController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/more_screen');
        }, icon: Icon(Icons.arrow_back_ios)),

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/clip_1.png')),
                    shape: BoxShape.circle,
                  ),
                ),
                const Text(
                  'John Deo',
                  style: TextStyle(fontSize: 19.66),
                ),
                const Text(
                  ' johndeo@yourmail.com',
                  style: TextStyle(fontSize: 17.2),
                ),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Orders Count',style: TextStyle(fontSize: 12),),
                          Text('16',style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text('Total Paid',style: TextStyle(fontSize: 12)),
                          Text('\$2342.55 ',style: TextStyle(fontSize: 12))

                        ],
                      )

                    ],
                  ),
                ),
                const Divider(),

                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                       SizedBox(height: 10,),
                      TextField(
                        onTap: () {},
                        controller: _kendrickTextController,
                        keyboardType: TextInputType.text,
                        decoration:   InputDecoration(
                          hintText: 'Firstname',
                          errorText: _kendrickErrorValue

                        ),
                      ),
                      const SizedBox(height: 10,),

                      TextField(
                        onTap: () {},
                        controller: _lastNameTextController,
                        keyboardType: TextInputType.name,
                        decoration:   InputDecoration(
                          hintText: 'Last name',
                          errorText: _lastNameErrorValue


                        ),
                      ),
                      const SizedBox(height: 10,),

                      TextField(
                        onTap: () {},
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration:   InputDecoration(
                          hintText: 'Email',
                          errorText: _emailErrorValue

                        ),
                      ),
                      const SizedBox(height: 10,),

                      TextField(
                        onTap: () {},
                        controller: _phoneTextController,
                        keyboardType: TextInputType.phone,
                        decoration:   InputDecoration(
                          hintText: 'Phone',
                          errorText: _phoneErrorValue


                        ),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(315, 50),
                            backgroundColor: const Color(0xFF6A90F2)
                        ),
                        onPressed: ()=>performSave(),
                        child: const Text('Save',style: TextStyle(color: Colors.white,fontSize: 20),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void performSave() {
    if (checkData()) {
      save();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _kendrickTextController.text.isNotEmpty &&
        _lastNameTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty) {
      return true;

    }
    setState(() {
      _emailErrorValue=_emailTextController.text.isNotEmpty? 'Enter email' :null;
      _kendrickErrorValue=_kendrickTextController.text.isNotEmpty? 'Enterkendrick' :null;
      _lastNameErrorValue=_lastNameTextController.text.isNotEmpty? 'Enter last name' :null;
      _phoneErrorValue=_phoneTextController.text.isNotEmpty? 'Enter phone' :null;

    });





    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enter , enter required data!'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
    return false;
  }

  void save() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Save Successful'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );  }



}
