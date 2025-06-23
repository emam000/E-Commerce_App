import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/const.dart';
import 'package:store/core/utils/sizeconfig/size_config.dart';
import 'package:store/features/cart/view/cart_view.dart';
import 'package:store/features/category/view/category_view.dart';
import 'package:store/features/favorite/view/favorite_view.dart';
import 'package:store/features/home/view/home_view.dart';
import 'package:store/features/profile/view/profile_view.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();
  List<Widget> screens = [
    HomeView(),
    CategoryView(),
    FavoriteView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackcolor,
      appBar: AppBar(
        title: Container(
          height: ScreenSize.height / 7,
          width: ScreenSize.width / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    appLogo,
                  ),
                  fit: BoxFit.fill)),
        ),
        // backgroundColor: kbackcolor,
        elevation: 0,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (index) {
          notchBottomBarController.index;
          setState(() {});
        },
        kBottomRadius: ScreenSize.width / 20,
        kIconSize: ScreenSize.width / 20,
        notchBottomBarController: notchBottomBarController,
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.home,
              color: kPrimaryColor,
            ),
            itemLabel: 'Home',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.category,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.category,
              color: kPrimaryColor,
            ),
            itemLabel: 'Category',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.favorite,
              color: Colors.grey, // blueGrey
            ),
            activeItem: Icon(
              Icons.favorite,
              color: kPrimaryColor,
            ),
            itemLabel: 'Favorite',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.shopping_cart,
              color: kPrimaryColor,
            ),
            itemLabel: 'Cart',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            activeItem: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            itemLabel: 'Profile',
          ),
        ],
      ),
      body: screens[notchBottomBarController.index],
    );
  }
}
