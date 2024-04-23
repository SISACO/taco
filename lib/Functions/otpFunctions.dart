import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Error.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Success.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

EmailOTP myAuth = EmailOTP();

sendOtp(TextEditingController emailcontroller, BuildContext context) async {
  myAuth.setConfig(
      appEmail: "monklobby@gmail.com",
      appName: "Taco",
      userEmail: emailcontroller.text,
      otpLength: 6,
      otpType: OTPType.digitsOnly);
  // myAuth.setSMTP(
  //   host: "smtp.taco.com",
  //   auth: true,
  //   username: "email-taco@monklobby.com",
  //   password: "*************",
  //   secure: "TLS",
  //   port: 576
  // );

  if (await myAuth.sendOTP() == true) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: CustomSnackBarContentSuccess(
          errorText: "OTP Send Successfully",
        ),
      ),
    );
  } else {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // behavior: SnackBarBehavior.floating,

        backgroundColor: Colors.transparent,
        elevation: 0,
        content: CustomSnackBarContentError(
          errorText: "Oops, OTP send failed",
        ),
      ),
    );
  }
}

String? verify(String? value,) {
  // if (value == null || value.isEmpty) {
  //   return 'OTP is required';
  // }
  // if (value.length != 6) {
  //   return 'OTP contain 6 characters';
  // }
  // if (myAuth.verifyOTP(otp: value) != true) {
  //   return 'Invaild OTP';
  // }
  return null;
}
