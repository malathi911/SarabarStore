import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle marquee(bool isWeb) => TextStyle(
    color: AppColors.white,
    fontSize: isWeb ? 18 : 14,
    height: 1.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle searchHint(bool isWeb) => TextStyle(
    color: AppColors.darkgrey,
    fontSize: isWeb ? 19 : 15,
    height: 1.0,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle sectionTitle(bool isWeb) => TextStyle(
    fontSize: isWeb ? 24 : 20,
    color: AppColors.primaryBlue,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle productName(bool isWeb) => TextStyle(
    fontSize: isWeb ? 16 : 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle cartItemName(bool isWeb) => TextStyle(
    fontSize: isWeb ? 18 : 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: AppColors.cartname,
  );
  static TextStyle profilelist(bool isWeb) => TextStyle(
    fontSize: isWeb ? 18 : 16,
    fontWeight: FontWeight.w300,
    fontFamily: 'Poppins',
    color: AppColors.cartname,
  );
  static TextStyle hometitle(bool isWeb) =>TextStyle(
  fontSize: isWeb ? 26 : 20,
  fontWeight: FontWeight.w600,
  color: AppColors.primaryBlue,
  fontFamily: 'Poppins'
  );

  static TextStyle pricedrop(bool isWeb) => TextStyle(
  fontSize: isWeb ? 16 : 12,
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontFamily: 'Poppins',
  decoration: TextDecoration.lineThrough,
  );

  static TextStyle homeprice(bool isWeb) => TextStyle(
  fontSize: isWeb ? 18 : 14,
  fontWeight: FontWeight.w500,
  color: Colors.black,
  fontFamily: 'Poppins'
  );

  static TextStyle cartTitle(bool isWeb) => TextStyle(
    fontSize: isWeb ? 30 : 25,
    color: AppColors.black,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle profilesignup(bool isWeb) => TextStyle(
    fontSize: isWeb ? 18 : 16,
    color: AppColors.white,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle cartPrice(bool isWeb) => TextStyle(
    fontSize: isWeb ? 19 : 17,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: AppColors.black,
  );

  static TextStyle oldPrice(bool isWeb) => TextStyle(
    fontSize: isWeb ? 16 : 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: AppColors.red,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle qtyText(bool isWeb) => TextStyle(
    fontSize: isWeb ? 18 : 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  );

  static TextStyle deliveryTitle(bool isWeb) => TextStyle(
    fontSize: isWeb ? 20 : 15,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: AppColors.darkgrey,
  );


  static TextStyle deliveryInfo(bool isWeb) => TextStyle(
    fontSize: isWeb ? 15 : 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.darkgrey,
  );

  static TextStyle signup(bool isWeb) => TextStyle(
    fontSize: isWeb ? 12 : 8,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle chooseAddressHint(bool isWeb) => TextStyle(
    fontSize: isWeb ? 14 : 12,
    fontFamily: 'Inter',
    color: AppColors.darkgrey,
    fontWeight: FontWeight.w300,
  );

  static TextStyle paymentMethod(bool isWeb) => TextStyle(
    fontSize: isWeb ? 15 : 10,
    fontFamily: 'Poppins',
    color: AppColors.darkgrey,
  );

  static TextStyle totalTitle(bool isWeb) => TextStyle(
    fontSize: isWeb ? 17 : 15,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColors.black,
  );

  static TextStyle totalAmount(bool isWeb) => TextStyle(
    fontSize: isWeb ? 19 : 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: AppColors.black,
  );
  static TextStyle price(bool isWeb) => TextStyle(
    fontSize: isWeb ? 19 : 17,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: AppColors.darkgrey,
  );
  static TextStyle payButton(bool isWeb) => TextStyle(
    fontSize: isWeb ? 18 : 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
    color: AppColors.white,
  );

  static TextStyle errorText(bool isWeb) => TextStyle(
    fontSize: isWeb ? 14 : 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: AppColors.redError,
  );

  static TextStyle title(bool isWeb) {
    return TextStyle(
      fontSize: isWeb ? 24 : 20, // Adjust font size based on web/mobile
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle label(bool isWeb) {
    return TextStyle(
      fontSize: isWeb ? 18 : 14,
      color: Colors.black,
    );
  }

  static TextStyle inputHint(bool isWeb) {
    return TextStyle(
      fontSize: isWeb ? 16 : 14,
      color: Colors.grey,
    );
  }

  static TextStyle buttonText(bool isWeb) {
    return TextStyle(
      fontSize: isWeb ? 16 : 14,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle terms(bool isWeb) {
    return TextStyle(
      fontSize: isWeb ? 14 : 12,
      color: Colors.grey,
    );
  }


}
