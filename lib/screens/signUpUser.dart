import 'dart:async';

import 'package:Taco/Functions/otpFunctions.dart';
import 'package:Taco/Functions/validations.dart';
import 'package:Taco/reuse/button.dart';
import 'package:Taco/reuse/textform.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({super.key});

  @override
  State<SignUpUser> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpUser> {
  final _formKey = GlobalKey<FormState>();
  final emailkey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _emailid = TextEditingController();
  final TextEditingController _otp = TextEditingController();

  String policymsg =
      'By pressing Next you will Accept our Terms and Conditions.';

  final double gap = 28;
  

  bool _isButtonpress = false;
  bool _hideText = true;

  Timer ?_timer;
  int _start = 5;
  bool isLoading = false;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
            _isButtonpress = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _start = 0;
    _isButtonpress = false;
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 12,),
                      ReusableTextFormField(
                        prefixIcon: Icons.person_outline_rounded,
                        textController: _username,
                        labelText: 'Username',
                        validator:validateUsern
                        
                      ),
                      SizedBox(height: gap),
                      ReusableTextFormField(
                        prefixIcon: Icons.lock_outline,
                        textController: _password,
                        labelText: 'Password',
                        obscureText: _hideText,
                        validator: validatePass,
                      
                        onPressed: () {
                          setState(() {
                            _hideText =!_hideText;
                          });
                        },
                        mySuffix: _hideText? Icons.visibility_off
                                : Icons.visibility,
                      ),
                      SizedBox(height: gap),
                      ReusableTextFormField(
                        prefixIcon: Icons.lock_outline,
                        textController: _confirmpassword,
                        labelText: 'Confirm Password',
                        obscureText: true,
                        validator: (value) {
                          if (value!=_password.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                      ),
                      SizedBox(height: gap),
                      Form(
                        key: emailkey,
                        child: TextFormField(
                                  
                          validator: validateEmail,
                          
                          controller: _emailid,
                          decoration: InputDecoration(
                            isDense: true, 
                            contentPadding: const EdgeInsets.fromLTRB(10, 26, 10, 10),
                            hintText: 'Email Address',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.normal),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 25, right: 10),
                              child: Icon(
                                Icons.email_outlined,
                                size: 30,
                              ),
                            ),
                            filled: true,
                            fillColor: appTheme.gray5099,
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.0),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.0),
                              borderSide: BorderSide(
                                color: appTheme.gray5099,
                                width: 1.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.0),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45.0),
                              borderSide:
                                  BorderSide(color: PrimaryColors().indigo400),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ElevatedButton(style: ElevatedButton.styleFrom(
                                backgroundColor: appTheme.indigo400
                              ),
                                onPressed: _isButtonpress == false
                                    ? () async {
                                      if (emailkey.currentState!.validate()){
                                        setState(() {
                                          _start = 5;
                                          isLoading = true;
                                          _isButtonpress = !_isButtonpress;
                                          startTimer();
                                        });
                                        
                                        sendOtp(_emailid, context);
                                        }
                            } : null,
                                child: Text('Get OTP',style: TextStyle(color:appTheme.whiteA700),),
                              ),
                            ),
                            
                          ),
                          
                        ),
                      ),
                      _start != 0
                          ? Padding(
                              padding: const EdgeInsets.only(right: 12, top: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Resend Code in",
                                    style: TextStyle(
                                        color: appTheme.indigo400,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _start.toString(),
                                    style: TextStyle(
                                        color: appTheme.indigo400,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(height: gap),
                      ReusableTextFormField(
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.message,
                        textController: _otp,
                        labelText: 'OTP',
                        validator:verify
                      
                      ),
                      SizedBox(height: gap),
                      
                      
                      SizedBox(height: gap),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            policymsg,
                            style: const TextStyle(fontSize: 11),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Policy & Privacy',
                                style: TextStyle(
                                    color: Color(0xFF84A2AF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ))
                        ],
                      ),
                      SizedBox(height: gap),
                      ReusableButton(
                        buttonText: 'Next',
                        onPressed: () {
                          // Sign Up logic
                          if (_formKey.currentState!.validate()) {
                          Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
                          }
                          // Navigator.pushNamed(context, '/homepage');
                        },
                        buttonColor: appTheme.indigo400,
                        textColor: appTheme.whiteA700,
                        buttonWidth: 90,
                        buttonHeight: 40,
                        buttonradius: 45,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
