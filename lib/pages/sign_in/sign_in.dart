import 'package:bloc_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText("or use your email account to login")),
              Container(
                margin: EdgeInsets.only(top: 65.h),
                padding: EdgeInsets.only(left: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField("Enter your Email", "email", "user"),
                    reusableText("Password"),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField("Enter your Password", "password", "lock"),
                    forgotPassword(),
                  ],
                ),
              ),
              buildLoginAndRegButton("Log In", "logIn"),
              buildLoginAndRegButton("Register", "register"),
            ],
          ),
        ),
      ),
    );
  }
}
