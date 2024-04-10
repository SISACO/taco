import 'package:Taco/Functions/validations.dart';
import 'package:Taco/reuse/TextForm.dart';
import 'package:Taco/reuse/button.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Success.dart';
import 'package:flutter/material.dart';

class ResetPassScrn extends StatelessWidget {
  ResetPassScrn({super.key});

  final TextEditingController _emailid = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                  child: Text('Reset',
                      style: TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.bold,color: appTheme.black900)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text('Password',
                      style: TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.bold,color: appTheme.black900)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(230.0, 169.0, 0.0, 0.0),
                  child: Text('?',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: appTheme.indigo400)),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Enter the email address associated with your account.',
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: appTheme.BlackTrans),
                    ),
                    const SizedBox(height: 30.0),
                    ReusableTextFormField(labelText: 'Email', validator: 
                    validateEmail
                    , textController: _emailid,
                    prefixIcon:Icons.email_outlined
                    ),
                    const SizedBox(height: 20,),
                    ReusableButton(buttonText: 'RESET PASSWORD',
                    buttonColor: appTheme.indigo400,
                    buttonWidth: 400,
                    buttonHeight: 46,
                    textColor: appTheme.whiteA700,
                    buttonradius: 40,
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                          resetPass(context);
                          }
                      
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
  resetPass(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: CustomSnackBarContentSuccess(
          errorText: "Password Reset Link has been Send",
        ),
      ),
    );
    Navigator.pushNamed(context, '/signin');
  }
}
   