import 'package:Taco/reuse/button.dart';
import 'package:Taco/reuse/textform.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Error.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Success.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final double gap = 28;

  bool _hideText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'Don\'t have an account? ',
                  style: TextStyle(color: Color(0xFF2E3233))),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: appTheme.blue200Af, fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: appTheme.blue200Af,
                      decorationThickness: 2,),
                ))
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                'taco',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: appTheme.indigo400
                ),
              ),
              const SizedBox(height: 58),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ReusableTextFormField(
                      
                      prefixIcon: Icons.person_outline_rounded,
                      textController: _username,
                      labelText: 'Username',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: gap),
                    ReusableTextFormField(
                      
                      prefixIcon: Icons.lock_outline,
                      textController: _password,
                      labelText: 'Password',
                      obscureText: _hideText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onPressed: () {
                          setState(() {
                            _hideText =!_hideText;
                          });
                        },
                        mySuffix: _hideText? Icons.visibility_off
                                : Icons.visibility,
                    ),
                    SizedBox(height: gap),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Forgot Your Password? ',
                              style: TextStyle(color: appTheme.black900)),
                          onTap: () {},
                        ),
                        GestureDetector(
                            onTap: () {
                            Navigator.pushNamed(context, '/resetpass');
                            },
                            child: Text(
                              'Forgot',
                              style: TextStyle(
                      color: appTheme.blue200Af, fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: appTheme.blue200Af,
                      decorationThickness: 2,),
                            ))
                      ],
                    ),
                    SizedBox(height: gap),
                    ReusableButton(
                      buttonText: 'LogIn',
                      onPressed: () {
                        // Sign in logic
                        if (_formKey.currentState!.validate()){
                        siginUser();
                        }
                        // siginUser();
                        
                      },
                      buttonColor: appTheme.indigo400,
                      textColor: appTheme.gray5099,
                      buttonWidth: 150,
                      buttonHeight: 40,
                    ),
                    
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

siginUser(){
    String usern='1234';
    String pass = '1234';
    String Username = _username.text;
    String Password = _password.text;

    if(Username == usern && Password == pass){
      ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    // behavior: SnackBarBehavior.floating,
                    
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: CustomSnackBarContentSuccess(
                      errorText:
                          "Logged In SuceessFully",
                    ),
                  ),
                );
      Navigator.pushNamedAndRemoveUntil(context, '/taconavbar', (route) => false);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    // behavior: SnackBarBehavior.floating,
                    
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: CustomSnackBarContentError(
                      errorText:
                          "The Username and Passsword doesn't Match.",
                    ),
                  ),
                );
    }
  }
}


