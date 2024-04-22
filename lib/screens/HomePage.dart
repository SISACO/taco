import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    var _selectIndex = 2;
    return SafeArea(   
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/magnifier.svg",width: 35,),
              ],
            ),
          ),
          title: Center(
            child: Text(
              'taco',
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: appTheme.black900),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/icons/mesage-active.svg",
                  width: 35,
                ),
                SizedBox(
                  width: 4,
                ),
                SvgPicture.asset(
                  "assets/icons/notification-bell-svgrepo-com.svg",
                  width: 35,
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            )
          ],
        ),
        
        bottomNavigationBar: BottomNavigationBar(
          
          backgroundColor: appTheme.gray5099,
          
      currentIndex: _selectIndex,
      
      onTap: (index) {       
          _selectIndex = index;      
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectIndex == 0
              ? 'assets/icons/group-icon.svg'
              : 'assets/icons/group-icon.svg',width: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectIndex == 1
              ? 'assets/icons/location-icon-active.svg'
              : 'assets/icons/location-icon.svg',width: 30,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectIndex == 2
              ? 'assets/icons/home-icon-active.svg'
              : 'assets/icons/home-icon.svg',width: 35,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectIndex == 3
              ? 'assets/icons/cart-icon-active.svg'
              : 'assets/icons/cart-icon.svg',width: 35,),
          label: 'cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectIndex == 4
              ? 'assets/icons/profile-circle-active.svg'
              : 'assets/icons/profile-circle.svg',width: 35,),
          label: '',
        ),
      ],
    ),
        body: Row(
          
        )
      ),
    );
  }
}

