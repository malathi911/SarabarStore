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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppTextStyles.cartItemName(isWeb).copyWith(
              fontSize: isWeb ? 25 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              itemCount: widget.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWeb
                    ? (MediaQuery.of(context).size.width > 1400 ? 4 : 3)
                    : 2,
                childAspectRatio: isWeb ? 0.78 : 0.65,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
              itemBuilder: (_, i) => _productItem(widget.items[i], isWeb),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- PRODUCT ITEM ----------------
  Widget _productItem(Map item, bool isWeb) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset(item[AppStrings.image], fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item[AppStrings.name],
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.productName(isWeb)),
                const SizedBox(height: 4),
                Text("₹139.00", style: AppTextStyles.homeprice(isWeb)),
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
