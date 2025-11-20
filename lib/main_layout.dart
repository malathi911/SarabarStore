import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/screens/cart_screen.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/wishlist_screen.dart';

import 'core/utils/app_colors.dart';

class MainLayout extends StatefulWidget {
  final int initialIndex;
  final List<Widget>? screens; // optional custom screens

  const MainLayout({super.key, this.initialIndex = 0, this.screens});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _index;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    screens = widget.screens ?? [
      const HomeScreen(),
      const CartScreen(),
      const WishlistScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: [
            // HOME
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: _index == 0 ? AppColors.primaryBlue : Colors.grey,
              ),
              label: "Home",
            ),

            // CART WITH BADGE (example count = 2)
            NavigationDestination(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/icons/cart.svg',
                    color: _index == 1 ? AppColors.primaryBlue : Colors.grey,
                  ),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              label: "Cart",
            ),

            // WISHLIST WITH BADGE (example count = 5)
            NavigationDestination(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/icons/wishlist.svg',
                    color: _index == 2 ? AppColors.primaryBlue : Colors.grey,
                  ),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              label: "Wishlist",
            ),

            // PROFILE
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                color: _index == 3 ? AppColors.primaryBlue : Colors.grey,
              ),
              label: "Profile",
            ),
          ],
        ),

    );
  }
}
