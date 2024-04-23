import 'package:Taco/reuse/button.dart';
import 'package:Taco/sampleData/Data.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:Taco/widgets/customSnackbar/CustomSnackBarContent_Error.dart';
import 'package:Taco/widgets/profileMenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? email;
  String? username;
  bool _ispatner = false;
  double gap = 15;
  List _post = [
    'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmeencurry.com%2Fwp-content%2Fuploads%2F2015%2F05%2Fwildlife-in-kerala-backwaters.jpg&f=1&nofb=1&ipt=c423324e2118e944b7b2b8e8de66c1f0c2571a6c10e664a93c0b5047c356998f&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fthewowstyle.com%2Fwp-content%2Fuploads%2F2015%2F01%2Fnature-images.jpg&f=1&nofb=1&ipt=cb4fdff0721737b410c6a9896525afc99a4f6e55a6e5bce7d2bcedb5c19dac5f&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg1.rapidleaks.com%2F2017%2F08%2F7-Places-In-Kerala-That-Are-Must-Visit-In-Monsoon-Season-6.jpg&f=1&nofb=1&ipt=e6779097c11416c118cc46a07ea2a75aa54fdee32f4fa0aa73e7cd1de0246c36&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.mediahacker.org%2Fwp-content%2Fuploads%2F2019%2F03%2FKovalam-1.jpg&f=1&nofb=1&ipt=fca1d91ffca4caf4bb661e53124bda66b5cdbfe26a096cfd45461f690a886651&ipo=images'
  ];
  bool isSelected = true;
  List<Room> rooms = generateRooms(10);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: getUserDataStream(uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.beat(
                  color: appTheme.indigo400, size: 30),
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          var data = snapshot.data!.data() as Map<String, dynamic>?;

          if (data != null) {
            _ispatner = data["ispatner"];
            return Scaffold(
              endDrawer: NavDrawer(),
              appBar: AppBar(
                  elevation: 2,
                  backgroundColor: appTheme.whiteA700,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text(
                          data["username"],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          !_ispatner ? Icons.verified : Icons.work,
                          color: appTheme.blue200Af,
                        )
                      ],
                    ),
                  ),

                  // actions: <Widget>[
                  //   Padding(
                  //     padding: const EdgeInsets.only(right: 8),
                  //     child: IconButton(
                  //       icon: Icon(
                  //         Icons.menu,
                  //         color: appTheme.indigo400,
                  //         weight: 40,
                  //         size: 38,
                  //       ),
                  //       onPressed: () {

                  //       },
                  //     ),
                  //   ),
                  // ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(2.0),
                    child: Container(
                      color: appTheme.gray5099,
                      height: 2.0,
                    ),
                  )),
              body: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 12, 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.dribbble.com%2Fusers%2F5534%2Fscreenshots%2F14230133%2Fprofile_4x.jpg&f=1&nofb=1&ipt=1032dadcc7150effe732ca4c51e37e9b9787252219648872cd05fe94248f6a9c&ipo=images"),
                                    fit: BoxFit.fitHeight),
                                color: appTheme.whiteA700,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 12, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data["username"],
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                color: appTheme.black900))),
                                    _ispatner
                                        ? Text('Joined Since 2023',
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: appTheme.black900)))
                                        : SizedBox(),
                                    Text(
                                        !_ispatner
                                            ? 'Verified Account'
                                            : 'Business Account',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: appTheme.gray5099))),
                                    Text(
                                        !_ispatner
                                            ? 'traveler'
                                            : 'Booking:985421232',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 13,
                                                color: appTheme.black900))),
                                  ],
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(!_ispatner ? '10' : '7.8'),
                                    Text(
                                        !_ispatner
                                            ? '  Perks  '
                                            : '  Ratings  ',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 11,
                                                color: appTheme.black900)))
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('1000'),
                                    Text('  Followers  ',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 11,
                                                color: appTheme.black900)))
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('100'),
                                    Text('  Following  ',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 11,
                                                color: appTheme.black900)))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            ReusableButton(
                              buttonText: 'EditProfile',
                              onPressed: () {},
                              textColor: appTheme.gray5099,
                              buttonColor: appTheme.indigo400,
                              buttonWidth: 170,
                              buttonHeight: 32,
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            ReusableButton(
                              buttonText:
                                  !_ispatner ? 'Add Post' : 'Statistics',
                              onPressed: () {},
                              textColor: appTheme.gray5099,
                              buttonColor: appTheme.indigo400,
                              buttonWidth: 170,
                              buttonHeight: 32,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    ReusableButton(
                      buttonText: 'Recent Orders & Status',
                      onPressed: () {},
                      textColor: appTheme.gray5099,
                      buttonColor: appTheme.indigo400,
                      buttonWidth: double.infinity,
                      buttonHeight: 35,
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    !_ispatner
                        ? Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg1.rapidleaks.com%2F2017%2F08%2F7-Places-In-Kerala-That-Are-Must-Visit-In-Monsoon-Season-6.jpg&f=1&nofb=1&ipt=e6779097c11416c118cc46a07ea2a75aa54fdee32f4fa0aa73e7cd1de0246c36&ipo=images"),
                                      fit: BoxFit.fitHeight),
                                  color: appTheme.whiteA700,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: gap,
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.mediahacker.org%2Fwp-content%2Fuploads%2F2019%2F03%2FKovalam-1.jpg&f=1&nofb=1&ipt=fca1d91ffca4caf4bb661e53124bda66b5cdbfe26a096cfd45461f690a886651&ipo=images"),
                                      fit: BoxFit.fitHeight),
                                  color: appTheme.whiteA700,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          )
                        : ReusableButton(
                            buttonText: 'Add Services & Edit',
                            onPressed: () {},
                            textColor: appTheme.gray5099,
                            buttonColor: appTheme.indigo400,
                            buttonWidth: double.infinity,
                            buttonHeight: 35,
                          ),
                    SizedBox(
                      height: gap,
                    ),
                    PreferredSize(
                      preferredSize: const Size.fromHeight(2.0),
                      child: Container(
                        color: appTheme.gray5099,
                        height: 2.0,
                        width: 500,
                      ),
                    ),
                    // SizedBox(height: gap,),
                    Text(!_ispatner ? 'Posts' : 'Active Services',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: appTheme.black900,
                                fontWeight: FontWeight.w600))),

                    PreferredSize(
                      preferredSize: const Size.fromHeight(2.0),
                      child: Container(
                        color: appTheme.gray5099,
                        height: 2.0,
                        width: 500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    !_ispatner
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _post.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,childAspectRatio: 1/1,
                            ),
                            
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Handle tap on the post
                                  // Navigate to post details, etc.
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.network(
                                    _post[index], // URL of the post image
                                    fit: BoxFit
                                        .cover, // Adjust the image size to cover the space
                                  ),
                                ),
                              );
                            })
                        : Container(
                            width: double.infinity,
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return PreferredSize(
                                  preferredSize: const Size.fromHeight(2.0),
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    color: appTheme.gray5099,
                                    height: 2.0,
                                    width: 500,
                                  ),
                                );
                              },
                              itemBuilder: (BuildContext context, index) {
                                
                                return SizedBox(
                                  height: 140,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 130,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  rooms[index].imageUrl),
                                              fit: BoxFit.fitHeight),
                                          color: appTheme.whiteA700,
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(rooms[index].bedType,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: appTheme.black900,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                          Flexible(
                                            child: Text(
                                                rooms[index].price.toString(),
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        color: appTheme
                                                            .black900))),
                                          ),
                                          Row(
                                            children: [
                                              Text('Status : ',
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontSize: 15,
                                                          color: appTheme
                                                              .black900))),
                                              Text(rooms[index].status,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Colors.green))),
                                            ],
                                          ),
                                          Text(rooms[index].date,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          appTheme.black900))),
                                          RatingBar.builder(
                                            itemSize: 20,
                                            ignoreGestures: true,
                                            initialRating: rooms[index].review,
                                            minRating: rooms[index].review,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            height: 39,
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Switch(
                                                activeColor: appTheme.indigo400,
                                                value: isSelected,
                                                onChanged: (value1) {                                                  
                                                    // setState(() {
                                                    //   isSelected = value1;
                                                    // }
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 70,
                                          ),
                                          GestureDetector(
                                            child: Text('Details>>',
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: appTheme
                                                            .black900))),
                                            onTap: () {},
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: rooms.length,
                            ),
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
                errorText: "Someting Went Wrong",
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
