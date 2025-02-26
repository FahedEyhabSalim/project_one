import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/on_boarding_content.dart';
import '../widgets/page_view_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OutBoarding extends StatefulWidget {
  const OutBoarding({super.key});

  @override
  State<OutBoarding> createState() => _OutBoardingState();
}

class _OutBoardingState extends State<OutBoarding> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController = PageController();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            if (_currentPage < 2)
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInBack);
                  },
                  child:  Text(
                    AppLocalizations.of(context)!.skip,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    // alignment: AlignmentDirectional.topEnd
                  ),
                ),
              ),

            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int currentPage) {
                  setState(() => _currentPage = currentPage);
                },
                scrollDirection: Axis.horizontal,
                children:  [
                  OnBoardingContent(
                    image: 'image_5',
                    title: AppLocalizations.of(context)!.welcome,
                  ),
                  OnBoardingContent(
                    image: 'image_3',
                      title: AppLocalizations.of(context)!.add_to_cart,
                  ),
                  OnBoardingContent(
                    image: 'image_4',
                    title: AppLocalizations.of(context)!.enjoy_purchase,),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewIndicator(isCurrentPage: _currentPage==0,marginEnd: 10,),
                PageViewIndicator(isCurrentPage: _currentPage==1,marginEnd: 10,),
                PageViewIndicator(isCurrentPage: _currentPage==2,),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: _currentPage == 2,
                maintainState: true,
                maintainSize: true,
                maintainAnimation: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/sgn_in_screen');
                      },
                      child:  Text(
                        AppLocalizations.of(context)!.start,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6A90F2),
                        shadowColor: Colors.transparent,
                        minimumSize:  Size(315.w, 50.h),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15)
                        // )
                      ),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}

