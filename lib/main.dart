import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_one/database/db_controller.dart';
import 'package:project_one/prefs/shared_pref_controller.dart';
import 'package:project_one/provider/language_provider.dart';
import 'package:project_one/screens/about_screen.dart';
import 'package:project_one/screens/cancel_order.dart';
import 'package:project_one/screens/cart_screen.dart';
import 'package:project_one/screens/favorites_screen.dart';
import 'package:project_one/screens/home_screen.dart';
import 'package:project_one/screens/more_screen.dart';
import 'package:project_one/screens/order_details_screen.dart';
import 'package:project_one/screens/orders_history.dart';
import 'package:project_one/screens/out_boarding.dart';
import 'package:project_one/screens/payment%20_mode_screen.dart';
import 'package:project_one/screens/payment_successful_screen.dart';
import 'package:project_one/screens/product_%20details.dart';
import 'package:project_one/screens/profile_screen.dart';
import 'package:project_one/screens/rate_order.dart';
import 'package:project_one/screens/reset_password.dart';
import 'package:project_one/screens/search_screen.dart';
import 'package:project_one/screens/sign_in_screen.dart';
import 'package:project_one/screens/sing_up_screen.dart';
import 'package:project_one/screens/splash_screen.dart';
import 'package:project_one/screens/verify_screen.dart';
import 'package:project_one/widgets/bottom_navigation_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await DbController().intiDatabase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      minTextAdapt: true,
      builder: (context,child){

      return ChangeNotifierProvider<LanguageProvider>(
        create: (context)=>LanguageProvider(),
        builder: (BuildContext context, Widget? child){
          return  MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                )
            ),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,

            ],


            supportedLocales: [
              Locale('ar'),
              Locale('en')
            ],

            locale: Locale(Provider.of<LanguageProvider>(context).language),


            initialRoute: '/splash_screen',
            routes:{
              '/splash_screen': (context) => const SplashScreen(),
              '/out_boarding': (context) => const OutBoarding(),
              '/sgn_in_screen': (context) => const SigIn(),
              '/sign_up_screen': (context) => const SingUp(),
              '/verify_screen': (context) => const VerifyScreen(),
              '/home_screen': (context) => const HomeScreen(),
              '/payment_mode_screen': (context) => const PaymentMode(),
              '/product_details_screen': (context) => const ProductDetails(),
              '/more_screen': (context) => const MoreScreen(),
              '/cart_screen': (context) => const CartScreen(),
              '/payment_successful_screen': (context) => const PaymentSuccessfulScreen(),
              '/profile_screen': (context) => const ProfileScreen(),
              '/cancel_orders_screen': (context) => const CancelOrderScreen(),
              '/orders_history_screen': (context) => const OrdersHistoryScreen(),
              '/bottom_navigation_screen': (context) => const BottomNavigationScreen(),
              '/favorites_screen': (context) => const FavoritesScreen(),
              '/rate_order_screen': (context) => const RateOrderScreen(),
              '/about_screen': (context) => const AboutScreen(),
              '/order_details_screen': (context) => const OrderDetailsScreen(),
              '/search_screen': (context) => const SearchScreen(),
              '/reset_password_screen': (context) => const ResetPassword(),

            },
          );
        },
      );
    },);
  }
}
