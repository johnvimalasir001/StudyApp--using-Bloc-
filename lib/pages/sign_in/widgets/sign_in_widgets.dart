import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Colors.grey.withOpacity(0.5),
        )),
    centerTitle: true,
    title: Text(
      "Log In",
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _reusableIcons("google"),
        _reusableIcons("apple"),
        _reusableIcons("facebook"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return SizedBox(
    width: 40.w,
    height: 40.w,
    child: Image.asset("assets/icons/$iconName.png"),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(1),
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.black),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 25.w),
          height: 16.w,
          width: 16.w,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          height: 50.h,
          width: 280.w,
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: "Avenir"),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 50.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(
          top: buttonType == "logIn" ? 30.h : 20.h, left: 25.w, right: 25.w),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: buttonType == "logIn" ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.w),
        ),
        border: Border.all(
            color: buttonType == "logIn" ? Colors.transparent : Colors.black),
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
            color: buttonType == "logIn" ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}