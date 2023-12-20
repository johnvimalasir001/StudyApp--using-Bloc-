import 'package:bloc_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_events.dart';
import 'package:bloc_app/pages/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      "assets/images/reading.png",
                      "First See Learning",
                      "Forget about a for of paper all knowledge in one learning",
                      "Next",
                      context,
                    ),
                    _page(
                      2,
                      "assets/images/boy.png",
                      "Connect With Everyone",
                      "Always keep in touch with your tutor & friend. Let's get connected!",
                      "Next",
                      context,
                    ),
                    _page(
                      3,
                      "assets/images/man.png",
                      "Always Fascinated learning",
                      "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                      "Get Started",
                      context,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50.h,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: state.page,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: Colors.black.withOpacity(0.5),
                      activeColor: Colors.blue,
                      size: const Size.square(8),
                      activeSize: const Size(18, 8),
                      activeShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page(int index, String imgurl, String title, String subTitle,
      String buttonName, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 345.h,
          width: 345.w,
          child: Image.asset(
            imgurl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(top: 8.h, left: 25.w, right: 25.w),
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
