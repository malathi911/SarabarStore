import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/utils/app_icons.dart';
import 'package:untitled/core/utils/app_images.dart';
import 'package:untitled/screens/profile_screen.dart';
import '../../core/utils/responsive.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_strings.dart';
import '../core/utils/app_text_styles.dart';
import '../core/widgets/signup_popup.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String selectedPayment = "prepaid";

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isWeb(context);

    return Scaffold(
      backgroundColor: AppColors.screencolor,
      appBar: AppBar(
        backgroundColor: AppColors.screencolor,   // ✔ SAME GREY AS SCREEN
        elevation: 0,
        automaticallyImplyLeading: false,
        title: _searchBox(isWeb, context),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cartItem(AppStrings.rotatingtoy, AppImages.cart1, 317.0, 350.0, isWeb),
            _cartItem(AppStrings.pencutterr, AppImages.cart2, 248.0, 299.0, isWeb),
            const SizedBox(height: 15),
            _deliveryAddressBox(isWeb),
            const SizedBox(height: 15),
            _cartTotalSection(isWeb),
          ],
        ),
      ),
    );
  }

  Widget _searchBox(bool isWeb, BuildContext context) {
    return Row(
      children: [
        // Back arrow for both mobile and web
        Container(
          height: isWeb ? 35 : 45,
          width: isWeb ? 35 : 45,
          decoration: BoxDecoration(
            color: AppColors.screencolor, // background same as screen
            borderRadius: BorderRadius.circular(12),
          ),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.leftarrow,
                height: isWeb ? 30 : 40,
                width: isWeb ? 30 : 40,
              ),
            ),
          ),
        ),

        SizedBox(width: isWeb ? 8 : 10),

        // Search box
        Expanded(
          child: Container(
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
    );
  }


  Widget _cartItem(String name, String image, double price, double oldPrice, bool isWeb) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: isWeb ? 140 : 110,
              height: isWeb ? 140 : 110,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.cartItemName(isWeb)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text("Rs. $price", style: AppTextStyles.cartPrice(isWeb)),
                    const SizedBox(width: 8),
                    Text("Rs. $oldPrice", style: AppTextStyles.oldPrice(isWeb)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _qtyBtn(Icons.remove),
                    const SizedBox(width: 10),
                    Text("1", style: AppTextStyles.qtyText(isWeb)),
                    const SizedBox(width: 10),
                    _qtyBtn(Icons.add),
                    const SizedBox(width: 20),
                    SvgPicture.asset(AppIcons.deleteicon, width: 20, height: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Icon(icon, size: 18),
    );
  }

  Widget _deliveryAddressBox(bool isWeb) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyBorder),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.deliveryAddressTitle, style: AppTextStyles.deliveryTitle(isWeb)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(AppStrings.deliveryAddressInfo, style: AppTextStyles.deliveryInfo(isWeb)),
                ),
                GestureDetector(  // Wrap the Container with GestureDetector to make it clickable
                  onTap: () {
                    openSignupPopup(context); // Opens the bottom sheet popup
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.signup, // Make sure AppStrings.signup is defined
                        style: AppTextStyles.signup(isWeb),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(AppStrings.chooseAddressHint, style: AppTextStyles.chooseAddressHint(isWeb)),
        ],
      ),
    );
  }
  Widget _cartTotalSection(bool isWeb) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyBorder),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==== Cart Total Title ====
          Text(AppStrings.carttotal, style: AppTextStyles.cartTitle(isWeb)),
          const SizedBox(height: 12),

          // ==== Payment Method ====
          Text(AppStrings.paymentmehod, style: AppTextStyles.paymentMethod(isWeb)),
          const SizedBox(height: 10),

          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedPayment = AppStrings.prepaid),
                child: Row(
                  children: [
                    Icon(
                      selectedPayment == AppStrings.prepaid ? Icons.circle : Icons.circle_outlined,
                      color: selectedPayment == AppStrings.prepaid ? AppColors.orange : AppColors.darkgrey,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(AppStrings.prepaid, style: AppTextStyles.paymentMethod(isWeb)),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => setState(() => selectedPayment = AppStrings.cod),
                child: Row(
                  children: [
                    Icon(
                      selectedPayment == AppStrings.cod ? Icons.circle : Icons.circle_outlined,
                      color: selectedPayment == AppStrings.cod ? AppColors.orange : AppColors.darkgrey,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(AppStrings.cod, style: AppTextStyles.paymentMethod(isWeb)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.subtotal, style: AppTextStyles.totalTitle(isWeb)),
              Text("₹620.00", style: AppTextStyles.price(isWeb)),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.deliveryCharges, style: AppTextStyles.totalTitle(isWeb)),
              Text("0", style: AppTextStyles.price(isWeb)),
            ],
          ),

          const Divider(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.total, style: AppTextStyles.totalAmount(isWeb)),
              Text("₹620.00", style: AppTextStyles.price(isWeb)),
            ],
          ),

          const SizedBox(height: 14),

          Center(
            child: Container(
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(AppStrings.payNow, style: AppTextStyles.payButton(isWeb))),
            ),
          ),

          const SizedBox(height: 10),
          Center(
            child: Text(
              AppStrings.noAddressError,
              style: AppTextStyles.errorText(isWeb),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

}
