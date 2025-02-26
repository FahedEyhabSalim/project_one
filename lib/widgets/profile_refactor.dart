import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfileRefactor extends StatelessWidget {
  const ProfileRefactor({
    // required this.title,
    // required this.icon,
    super.key,
  });
  // final String title;
  // final String icon;
  //


  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: (){
      Navigator.pushNamed(context, '/profile_screen');
    }, icon: const Icon(Icons.person,color: Color(0xFF87879D),), label:  Text(AppLocalizations.of(context)!.my_profile,style: TextStyle(color: Color(0xFF87879D)),));
  }
}
