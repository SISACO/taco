import 'dart:math';

import 'package:Taco/sampleData/Data.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> numbersList = NumberGenerator().numbers;

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
      //  bottomNavigationBar: tacoNavbar(),
        body: RefreshIndicator(
          color: appTheme.indigo400,
          onRefresh: _pullRefresh,
          child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              AppBar(
                leadingWidth: 70,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/magnifier.svg",
                        width: 30,
                      ),
                    ],
                  ),
                ),
                title: Center(
                  child: Text(
                    'taco',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: appTheme.black900),
                  ),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/mesage-active.svg",
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                         
SvgPicture.asset(
                            "assets/icons/notification-bell-svgrepo-com.svg",
                            width: 30,
                          ),
                           CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                            child: Text( "9+",style: TextStyle(fontSize: 9,color: appTheme.whiteA700),),
                          ),
                          ],
                          
                        ),
                        SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InstagramStoriesCircle(
                                  imageUrl: 'https://via.placeholder.com/150',
                                  size: 60),
                              Text(
                                notifications[index]["name"],
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 11),
                              )
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox();
                  },
                ),
              ),
              ListView.separated(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    height: 400,
                    width: 150,
                    decoration: BoxDecoration(
                        color: appTheme.blue200Af.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Stack(
                                children: [
                                      InstagramStoriesCircle(
                                      imageUrl: 'https://via.placeholder.com/150',
                                      size: 50),
                                    ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          
                                          
                                          posts[index]["name"],
                                          style: TextStyle(fontSize: 15,),
                                        ),
                                        Text(
                                          posts[index]["time"],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: appTheme.BlackTrans),
                                        ),
                                        
                                                                     
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 205),
                                      child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),color:appTheme.indigo400
                                        
                                      ))
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: appTheme.indigo400,
                              borderRadius: BorderRadius.circular(10)),
                          height: 200,
                          width: 350,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/heart-outlined.svg",
                                width: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                "assets/icons/comment-svgrepo-com(1).svg",
                                width: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                "assets/icons/location-1-svgrepo-com.svg",
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                posts[index]["likes"],
                                style: TextStyle(
                                    fontSize: 15, color: appTheme.BlackTrans),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                groups[index]["msg"],
                                style: TextStyle(
                                    fontSize: 15, color: appTheme.black900),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _pullRefresh() async {
    List<String> freshNumbers = await NumberGenerator().slowNumbers();
    setState(() {
      numbersList = freshNumbers;
    });
  }
}

class InstagramStoriesCircle extends StatelessWidget {
  final String imageUrl;
  final double size;

  InstagramStoriesCircle({required this.imageUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                const Color.fromARGB(255, 177, 206, 231),
                Color.fromRGBO(111, 186, 240, 1),
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: size - 6.0,
              height: size - 6.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 184, 184, 184),
                    Color.fromARGB(255, 223, 223, 223),
                  ],
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NumberGenerator {
  Future<List<String>> slowNumbers() async {
    return Future.delayed(
      const Duration(milliseconds: 1000),
      () => numbers,
    );
  }

  List<String> get numbers => List.generate(5, (index) => number);

  String get number => Random().nextInt(99999).toString();
}


