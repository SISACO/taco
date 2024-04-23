import 'package:Taco/Functions/validations.dart';
import 'package:Taco/reuse/TextForm.dart';
import 'package:Taco/reuse/button.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Error.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ResetPassScrn extends StatelessWidget {
  ResetPassScrn({super.key});

  final TextEditingController _emailid = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

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
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          color: appTheme.black900)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                  child: Text('Password',
                      style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          color: appTheme.black900)),
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
              padding:
                  const EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
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
                    ReusableTextFormField(
                        labelText: 'Email',
                        validator: validateEmail,
                        textController: _emailid,
                        prefixIcon: Icons.email_outlined),
                    const SizedBox(
                      height: 20,
                    ),
                    !loading
                        ? ReusableButton(
                            buttonText: 'RESET PASSWORD',
                            buttonColor: appTheme.indigo400,
                            buttonWidth: 400,
                            buttonHeight: 46,
                            textColor: appTheme.whiteA700,
                            buttonradius: 40,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                resetPassword(context);
                              }
                            })
                        : LoadingAnimationWidget.staggeredDotsWave(
                            color: appTheme.indigo400, size: 50)
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

  Future resetPassword(BuildContext context) async {
    String email = _emailid.text;
    final snapshot = await FirebaseFirestore.instance
        .collection('userData')
        .where('email', isEqualTo: email.trim())
        .limit(1)
        .get();
    if (snapshot.docs.isNotEmpty) {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.trim())
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // behavior: SnackBarBehavior.floating,

            backgroundColor: Colors.transparent,
            elevation: 0,
            content: CustomSnackBarContentSuccess(
              errorText: 'Reset Password Link has been send to the Email',
            ),
          ),
        );
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // behavior: SnackBarBehavior.floating,

            backgroundColor: Colors.transparent,
            elevation: 0,
            content: CustomSnackBarContentError(
              errorText: e.toString(),
            ),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // behavior: SnackBarBehavior.floating,

          backgroundColor: Colors.transparent,
          elevation: 0,
          content: CustomSnackBarContentError(
            errorText: 'Email Address Not Found',
          ),
        ),
      );
    }
  }
}
