import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_icons.dart';

void openSignupPopup(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: _signupUI(context),
      );
    },
  );
}

Widget _signupUI(BuildContext context) {
  bool isWeb = kIsWeb;

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sign up to continue",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppIcons.cross_icon,
              height: isWeb ? 28 : 22,
              width: isWeb ? 28 : 22,
            ),
          ),
        ],
      ),

      const SizedBox(height: 15),

      Text(
        "Phone Number",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
      ),

      TextField(
        keyboardType: TextInputType.number,
        maxLength: 10,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: const InputDecoration(
          counterText: "",
          hintText: "9876543210",
          border: UnderlineInputBorder(),
        ),
      ),

      const SizedBox(height: 25),

      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          openOtpSentPopup(context);
        },
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),

      const SizedBox(height: 35),
    ],
  );
}
void openOtpSentPopup(BuildContext context) {
  bool isWeb = kIsWeb;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {

      Future.delayed(const Duration(seconds: 2), () {
        if (Navigator.canPop(context)) Navigator.pop(context);
        openOtpVerifyPopup(context);
      });

      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    AppIcons.cross_icon,
                    height: isWeb ? 28 : 22,
                    width: isWeb ? 28 : 22,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              "OTP sent !",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.otptickcolor, width: 5),
              ),
              child: const Icon(Icons.check, size: 40, color: AppColors.otptickcolor),
            ),

            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
void openOtpVerifyPopup(BuildContext context) {
  bool isWeb = kIsWeb;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20, right: 20, top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.leftarrow,
                      height: isWeb ? 26 : 32,
                      width: isWeb ? 26 : 32,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "CHANGE NUMBER",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins"),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    AppIcons.cross_icon,
                    height: isWeb ? 28 : 22,
                    width: isWeb ? 28 : 22,
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Enter OTP Sent to 9876543210",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  width: 40,
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 15),

            const Text(
              "Resend OTP in 60s",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),

            const SizedBox(height: 25),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                Future.delayed(const Duration(milliseconds: 200), () {
                  openVerifiedPopup(context);
                });
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height: 25),
          ],
        ),
      );
    },
  );
}

void openVerifiedPopup(BuildContext context) {
  bool isWeb = kIsWeb;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    AppIcons.cross_icon,
                    height: isWeb ? 28 : 22,
                    width: isWeb ? 28 : 22,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              "Verified",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:AppColors.otptickcolor, width: 5),
              ),
              child: const Icon(Icons.check,
                  size: 40, color: AppColors.otptickcolor),
            ),

            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
