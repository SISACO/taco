import 'package:Taco/reuse/button.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? email;
  String? username;
  bool? ispatner;
  double gap = 15;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: getUserDataStream(uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingAnimationWidget.beat(
                color: appTheme.indigo400, size: 30);
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          var data = snapshot.data!.data() as Map<String, dynamic>?;

          if (data != null) {
            return Scaffold(
              appBar: AppBar(
                  elevation: 2,
                  backgroundColor: appTheme.whiteA700,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      data["username"],
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: appTheme.indigo400,
                      ),
                      onPressed: () {},
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(2.0),
                    child: Container(
                      color: appTheme.gray5099,
                      height: 2.0,
                    ),
                  )),
              body: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('name'),
                            Text('Verified'),
                            Text('traveler'),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('10'), Text('  perks  ')],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('1000'), Text('  followers  ')],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('100'), Text('  following  ')],
                                ),
                              ],
                            ),
                            SizedBox(height: gap,),
                            ReusableButton(
                              buttonText: 'EditProfile',
                              onPressed: () {},
                              textColor: appTheme.gray5099,
                              buttonColor: appTheme.indigo400,
                              buttonWidth: 190,
                              buttonHeight: 35,
                            ),SizedBox(height: gap,),
                            ReusableButton(
                              buttonText: 'Add Post',
                              onPressed: () {},
                              textColor: appTheme.gray5099,
                              buttonColor: appTheme.indigo400,
                              buttonWidth: 190,
                              buttonHeight: 35,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: gap,),
                        ReusableButton(
                          buttonText: 'Recent Orders & Status',
                          onPressed: () {},
                          textColor: appTheme.gray5099,
                          buttonColor: appTheme.indigo400,
                          buttonWidth: double.infinity,
                          buttonHeight: 39,
                        )
                  ],
                ),
              )),
            );
          } else {
            return SnackBar(
              // behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: CustomSnackBarContentError(
                errorText: "User not found",
              ),
            );
          }
        });
  }

  User? user = FirebaseAuth.instance.currentUser;
  late var uid = user!.uid;

  Stream<DocumentSnapshot> getUserDataStream(String uid) {
    return FirebaseFirestore.instance
        .collection('userData')
        .doc(uid)
        .snapshots();
  }
}
