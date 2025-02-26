import 'package:flutter/material.dart';
import 'package:project_one/prefs/shared_pref_controller.dart';

import '../widgets/profile_refactor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
            style: TextStyle(fontSize: 17.2, color: Color(0xFF87879D)),
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileRefactor(),
                const Divider(),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorites_screen');
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Color(0xFF87879D),
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.favorites,
                      style: TextStyle(color: Color(0xFF87879D)),
                    )),
                const Divider(),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/order_details_screen');
                    },
                    icon: const Icon(
                      Icons.date_range,
                      color: Color(0xFF87879D),
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.order,
                      style: TextStyle(color: Color(0xFF87879D)),
                    )),
                const Divider(),
                TextButton.icon(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/payment_mode_screen');
                    },
                    icon: const Icon(
                      Icons.security_outlined,
                      color: Color(0xFF87879D),
                    ),
                    label: Text(
                      'Terms & Conditions',
                      style: TextStyle(color: Color(0xFF87879D)),
                    )),
                const Divider(),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about_screen');
                    },
                    icon: const Icon(
                      Icons.lock,
                      color: Color(0xFF87879D),
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.privacy_policy,
                      style: TextStyle(color: Color(0xFF87879D)),
                    )),
                const Divider(),
                TextButton.icon(
                    onPressed: () => _confirmLogoutDialog(context),
                    icon: const Icon(
                      Icons.logout,
                      color: Color(0xFF87879D),
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.log_out,
                      style: TextStyle(color: Color(0xFF87879D)),
                    )),
                const Divider()
              ],
            ),
          )
        ],
      ),
    );
  }

  void _confirmLogoutDialog(BuildContext context) async {
    bool? result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.confirm_logout_title,
          ),
          titleTextStyle: TextStyle(fontSize: 16,color: Colors.black),
          content: Text(
            AppLocalizations.of(context)!.confirm_logout_content,
          ),
          contentTextStyle: TextStyle(fontSize: 14,color: Colors.black),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                  'نعم',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                  'الغاء',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
    if (result ?? false) {
      bool cleared = await SharedPrefController().removeValueFor(Prefkeys.loggedIn.name);
      if(cleared){
        Navigator.pushReplacementNamed(context, '/sgn_in_screen');
      }
    }
  }
}
