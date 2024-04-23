import 'package:Taco/sampleData/bannerdata.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

final _control = PageController();

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray5099,
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
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
                          child: Text(
                            "9+",
                            style: TextStyle(
                                fontSize: 9, color: appTheme.whiteA700),
                          ),
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
          body: CustomScrollView(
            slivers: [
              SearchBox(),
              bannerr(),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: appTheme.whiteA700,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 120),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/${index + 1}.jpg',
                                          ),
                                          fit: BoxFit.fitHeight),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  )
                                  // Image.asset(
                                  //   'assets/images/${index + 1}.jpg',
                                  //   height: 200,
                                  //   width: 190,
                                  //   fit: BoxFit.cover,

                                  // ),
                                  ),
                              Positioned(
                                top: 155,
                                left: 20,
                                child: Text(
                                  banners()[index].name!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 210,
                                right: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$ ' + banners()[index].price!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: appTheme.indigo400
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: Colors.white,
                                        ),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: appTheme.bluebox,
                                          borderRadius:
                                              BorderRadius.circular(11),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 4,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 270,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter bannerr() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: PageView(
              controller: _control,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appTheme.blue200Af,
                    ),
                    child: banner_builder(0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appTheme.blue200Af,
                    ),
                    child: banner_builder(1),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appTheme.blue200Af,
                    ),
                    child: banner_builder(2),
                  ),
                ),
              ],
            ),
          ),
          // SmoothPageIndicator(
          //   controller: _control,
          //   count: 3,
          //   effect: WormEffect(
          //     dotHeight: 11,
          //     dotWidth: 11,
          //     activeDotColor: Color(0xffFF033E),
          //   ),
          // ),
        ],
      ),
    );
  }

  Row banner_builder(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       // SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'New Relase',
              style: TextStyle(
                color: appTheme.black900,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              banners()[count].name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Force 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              width: 90,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appTheme.indigo400,
              ),
              child: Text(
                'buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Image.asset(
          'assets/images/${banners()[count].image!}',
          height: 110,
          width: 150,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  SliverToBoxAdapter SearchBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(5, 10), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15),
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 15),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Color.fromARGB(255, 194, 187, 187),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              flex: 6,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appTheme.gray5099,
                ),
                child: Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                  size: 27,
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
