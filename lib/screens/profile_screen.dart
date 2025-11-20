import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/utils/app_strings.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_icons.dart';
import '../../core/utils/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../core/utils/app_images.dart';
import 'package:flutter/services.dart';

import '../core/widgets/signup_popup.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isWeb(context);

    return Scaffold(
      backgroundColor: AppColors.screencolor,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------- Profile Avatar + Sign Up Button -------------------
            Row(
              children: [
                // Avatar
                CircleAvatar(
                  radius: isWeb ? 35 : 30,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    AppImages.profile,
                    height: isWeb ? 60 : 50,
                    width: isWeb ? 60 : 50,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 15),

                // Sign up button
                GestureDetector(
                  onTap: () =>  openSignupPopup(context),// <-- BOTTOM POPUP
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      AppStrings.signup,
                      style: AppTextStyles.profilesignup(isWeb),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            _profileItem(icon: AppIcons.profile_heart, label: AppStrings.mywishlist, isWeb: isWeb),
            const Divider(),

            _profileItem(icon: AppIcons.order, label: AppStrings.myorders, isWeb: isWeb),
            const Divider(),

            _profileItem(icon: AppIcons.legal, label: AppStrings.legalpol, isWeb: isWeb),
          ],
        ),
      ),
    );
  }

  //---------------- PROFILE ITEM ----------------
  Widget _profileItem({required String icon, required String label, required bool isWeb}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          SvgPicture.asset(icon, width: isWeb ? 26 : 22, height: isWeb ? 26 : 22),
          const SizedBox(width: 14),
          Text(label, style: AppTextStyles.profilelist(isWeb)),
        ],
      ),
    );
  }

  // ---------------- SIGNUP POPUP ----------------
  // void _openSignupPopup(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //           left: 20,
  //           right: 20,
  //           top: 20,
  //         ),
  //         child: _signupPopupUI(context),
  //       );
  //     },
  //   );
  // }
  //
  // Widget _signupPopupUI(BuildContext context) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // Header
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Sign up to continue",
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,fontFamily: 'Poppins'),
  //           ),
  //           GestureDetector(
  //             onTap: () => Navigator.pop(context),
  //             child: Icon(Icons.close),
  //           ),
  //         ],
  //       ),
  //
  //       const SizedBox(height: 15),
  //
  //       Text("Phone Number",
  //           style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Poppins')),
  //       TextField(
  //         keyboardType: TextInputType.number,
  //         maxLength: 10,
  //         inputFormatters: [
  //           FilteringTextInputFormatter.digitsOnly,
  //           LengthLimitingTextInputFormatter(10),
  //         ],
  //         decoration: InputDecoration(
  //           counterText: "",
  //           hintText: "9876543210",
  //           border: UnderlineInputBorder(),
  //         ),
  //       ),
  //
  //
  //       const SizedBox(height: 25),
  //
  //       Container(
  //         width: double.infinity,
  //         height: 45,
  //         decoration: BoxDecoration(
  //           color: AppColors.primaryBlue,
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: const Center(
  //           child: Text(
  //             "Continue",
  //             style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Poppins',fontWeight: FontWeight.w600),
  //           ),
  //         ),
  //       ),
  //
  //       const SizedBox(height: 35),
  //     ],
  //   );
  // }
}
