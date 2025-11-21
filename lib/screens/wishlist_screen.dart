import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_icons.dart';
import '../core/utils/app_images.dart';
import '../core/utils/app_strings.dart';
import '../core/utils/app_text_styles.dart';
import '../core/utils/responsive.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isWeb(context);

    return Scaffold(
      backgroundColor: AppColors.screencolor,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(context, isWeb),
            const SizedBox(height: 10),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isWeb ? 150 : 26), // <-- ADD MORE SPACE
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isWeb ? 3 : 2,
                    childAspectRatio: isWeb ? 0.75 : 0.70,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return _buildWishlistItem(isWeb);
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }



  Widget _buildSearchBar(BuildContext context, bool isWeb) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 16, vertical: 10),
      color: AppColors.screencolor, // ✔ SAME GREY BACKGROUND LIKE CART SCREEN
      child: Row(
        children: [

          // Back button (same as cart)
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: AppColors.screencolor,   // ✔ grey background
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.leftarrow,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
          ),

          if (!isWeb) const SizedBox(width: 10),

          // Search box
          Expanded(
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.white, // ✔ white search box only
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
                  SvgPicture.asset(
                    AppIcons.search_icon,
                    height: 22,
                    width: 22,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  // ----------------------------------------------------------------
  // Wishlist Item Card UI
  // ----------------------------------------------------------------
  Widget _buildWishlistItem( bool isWeb) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔥 Responsive image for mobile + web
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Image.asset(
                    AppImages.pro1,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                right: isWeb ? 44 : 26, // more spacing on web
                top: isWeb ? 14 : 10,   // adjust vertical position
                child: CircleAvatar(
                  radius: isWeb ? 18 : 14, // bigger circle on web
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    AppIcons.heart,
                    width: isWeb ? 26 : 24,  // bigger icon on web
                    height: isWeb ? 26 : 24,
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 6),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: isWeb ? 44 : 22), // more spacing on web
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                 AppStrings.pencutter,
                   style: AppTextStyles.productName(isWeb),
                ),

                const SizedBox(height: 1),

                Row(
                  children: const [
                    Text(
                      "₹139.00",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "₹329.00",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        decoration: TextDecoration.lineThrough,
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
}
