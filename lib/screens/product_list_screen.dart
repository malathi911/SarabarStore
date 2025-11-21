import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/screens/cart_screen.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/wishlist_screen.dart';
import '../core/utils/app_strings.dart';
import '../core/utils/app_text_styles.dart';
import '../core/utils/responsive.dart';
import '../core/utils/app_images.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_icons.dart';

class ProductListScreen extends StatefulWidget {
  final String title;
  final List items;

  const ProductListScreen({super.key, required this.title, required this.items});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int _selectedIndex = 0; // track active bottom menu tab

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: AppColors.screencolor,

      // ---------- APP BAR ----------
      appBar: AppBar(
        backgroundColor: AppColors.screencolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.leftarrow, height: 34, width: 34),
          onPressed: () => Navigator.pop(context),
        ),
        title: _searchBar(context, isWeb),
      ),

      // ---------- BODY ----------
      body: _bodyContent(isWeb),

      // ---------- BOTTOM NAVIGATION ----------
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: _selectedIndex,
      //   indicatorColor: AppColors.primaryBlue.withOpacity(0.15),
      //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      //   onDestinationSelected: (i) {
      //     setState(() => _selectedIndex = i); // update highlight
      //   },
      //   destinations: [
      //     NavigationDestination(
      //       icon: SvgPicture.asset('assets/icons/home.svg', color: _selectedIndex == 0 ? AppColors.primaryBlue : Colors.grey),
      //       label: "Home",
      //     ),
      //     NavigationDestination(
      //       icon: SvgPicture.asset('assets/icons/cart.svg', color: _selectedIndex == 1 ? AppColors.primaryBlue : Colors.grey),
      //       label: "Cart",
      //     ),
      //     NavigationDestination(
      //       icon: SvgPicture.asset('assets/icons/wishlist.svg', color: _selectedIndex == 2 ? AppColors.primaryBlue : Colors.grey),
      //       label: "Wishlist",
      //     ),
      //     NavigationDestination(
      //       icon: SvgPicture.asset('assets/icons/profile.svg', color: _selectedIndex == 3 ? AppColors.primaryBlue : Colors.grey),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
    );
  }

  // ---------------- SWITCH BODY CONTENT ----------------
  Widget _bodyContent(bool isWeb) {
    switch (_selectedIndex) {
      case 0:
        return _productGrid(isWeb); // Product list
      case 1:
        return const CartScreen();
      case 2:
        return const WishlistScreen();
      case 3:
        return const ProfileScreen();
      default:
        return _productGrid(isWeb);
    }
  }

  // ---------------- PRODUCT GRID ----------------
  Widget _productGrid(bool isWeb) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------- TITLE -------
            Text(
              widget.title,
              style: AppTextStyles.hometitle(isWeb),
            ),

            const SizedBox(height: 12),

            // ------- GRID VIEW (NON-SCROLLABLE) -------
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),  // 🔥 Important
              itemCount: widget.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWeb
                    ? (MediaQuery.of(context).size.width > 1200 ? 4 : 3)
                    : 2,
                childAspectRatio: isWeb ? 0.75 : 0.73,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
              itemBuilder: (_, i) => _productItem(widget.items[i], isWeb),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }


// ---------------- PRODUCT ITEM ----------------
  Widget _productItem(Map item, bool isWeb) {
    double containerWidth = isWeb ? 220 : 150;
    double imageHeight = isWeb ? 270 : 180;
    double heartRadius = isWeb ? 18 : 14;
    double heartIconSize = isWeb ? 26 : 24;
    double horizontalPadding = isWeb ? 12 : 10;
    double verticalSpacing = isWeb ? 12 : 10;

    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // <-- Prevent Column from taking infinite height
        children: [
          // IMAGE + HEART ICON
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.asset(
                  item[AppStrings.image],
                  width: double.infinity,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  radius: heartRadius,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    AppIcons.heart,
                    width: heartIconSize,
                    height: heartIconSize,
                  ),
                ),
              ),
            ],
          ),

          // PRODUCT DETAILS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalSpacing / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // <-- important to avoid overflow
              children: [
                Text(
                  item[AppStrings.name],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.productName(isWeb).copyWith(
                    fontSize: isWeb ? 18 : 14,
                    fontWeight: isWeb ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                SizedBox(height: verticalSpacing / 2),
                Row(
                  children: [
                    Text(
                      "₹139.00",
                      style: AppTextStyles.homeprice(isWeb).copyWith(
                        fontSize: isWeb ? 16 : 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Rs.325.00",
                      style: AppTextStyles.pricedrop(isWeb).copyWith(
                        fontSize: isWeb ? 14 : 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  // ---------------- SEARCH BAR ----------------
  Widget _searchBar(BuildContext context, bool isWeb) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.logo, height: 22, width: 22),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                hintStyle: AppTextStyles.searchHint(isWeb),
                border: InputBorder.none,
              ),
            ),
          ),
          SvgPicture.asset(AppIcons.search_icon, height: 22, width: 22, color: Colors.black),
        ],
      ),
    );
  }
}
