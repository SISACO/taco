import 'package:Taco/screens/CommunityPage.dart';
import 'package:Taco/screens/HomePage.dart';
import 'package:Taco/screens/ProfilePage.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class tacoNavbar extends StatefulWidget {
  tacoNavbar({
    super.key,
  });

  @override
  State<tacoNavbar> createState() => _tacoNavbarState();
}

class _tacoNavbarState extends State<tacoNavbar> {
  var _selectIndex = 1;
  List tabWidget = <Widget>[CommunityPage(),HomeScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: appTheme.whiteA700,
          currentIndex: _selectIndex,
          onTap: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  _selectIndex == 0
                      ? 'assets/icons/group-icon-filled.svg'
                      : 'assets/icons/group-icon.svg',
                  width: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectIndex == 1
                    ? 'assets/icons/location-icon-active.svg'
                    : 'assets/icons/location-icon.svg',
                width: 25,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectIndex == 2
                    ? 'assets/icons/home-icon-active.svg'
                    : 'assets/icons/home-icon.svg',
                width: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectIndex == 3
                    ? 'assets/icons/cart-icon-active.svg'
                    : 'assets/icons/cart-icon.svg',
                width: 30,
              ),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _selectIndex == 4
                    ? 'assets/icons/profile-circle-active.svg'
                    : 'assets/icons/profile-circle.svg',
                width: 30,
              ),
              label: '',
            ),
          ],
        ),
        body: tabWidget[_selectIndex]);
  }
}
