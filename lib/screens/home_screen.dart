import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/utils/app_icons.dart';
import 'package:untitled/core/utils/app_images.dart';
import 'package:untitled/screens/product_list_screen.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/wishlist_screen.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/web_marquee.dart';
import '../main_layout.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late PageController _pageController;
  int _currentPage = 0;

  List<String> get loopImages => [...sliderImages, sliderImages.first];


  // Slider Images
  final List<String> sliderImages = const [
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3,
    AppImages.slider4,
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    Future.delayed(const Duration(seconds: 3), autoSlide);
  }


  void autoSlide() {
    if (!mounted) return;

    int nextPage = _pageController.page!.round() + 1;

    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );

    // When it reaches the last duplicate page → jump back to page 0 silently
    if (nextPage == loopImages.length) {
      Future.delayed(const Duration(milliseconds: 700), () {
        if (!mounted) return;
        _pageController.jumpToPage(0); // no animation
      });
    }

    Future.delayed(const Duration(seconds: 3), autoSlide);
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Categories
  final List<Map<String, String>> categories = const [
    {AppStrings.icon: AppImages.cats1, AppStrings.name: AppStrings.stationary},
    {AppStrings.icon: AppImages.cats2, AppStrings.name: AppStrings.toys},
    {AppStrings.icon: AppImages.cats3, AppStrings.name: AppStrings.ecofriendly},
    {
      AppStrings.icon: AppImages.cats4,
      AppStrings.name: AppStrings.babyproducts,
    },
    {AppStrings.icon: AppImages.cats5, AppStrings.name: AppStrings.giftitems},
  ];

  // Products list (example)
  final List<Map<String, String>> products = const [
    {AppStrings.image: AppImages.pro1, AppStrings.name: AppStrings.pencutter},
    {
      AppStrings.image: AppImages.pro2,
      AppStrings.name: AppStrings.classmatebook,
    },
    {AppStrings.image: AppImages.pro3, AppStrings.name: AppStrings.ballpen},
    {AppStrings.image: AppImages.pro1, AppStrings.name: AppStrings.pencutter},
    {
      AppStrings.image: AppImages.pro2,
      AppStrings.name: AppStrings.classmatebook,
    },
    {AppStrings.image: AppImages.pro3, AppStrings.name: AppStrings.ballpen},
    {AppStrings.image: AppImages.pro1, AppStrings.name: AppStrings.pencutter},
    {
      AppStrings.image: AppImages.pro2,
      AppStrings.name: AppStrings.classmatebook,
    },
    {AppStrings.image: AppImages.pro3, AppStrings.name: AppStrings.ballpen},
  ];

  // Product list toy (example)
  final List<Map<String, String>> toys = const [
    {AppStrings.image: AppImages.toy1, AppStrings.name: AppStrings.remotecar},
    {
      AppStrings.image: AppImages.pro2,
      AppStrings.name: AppStrings.classmatebook,
    },
    {AppStrings.image: AppImages.pro3, AppStrings.name: AppStrings.ballpen},
    {AppStrings.image: AppImages.toy1, AppStrings.name: AppStrings.remotecar},
    {
      AppStrings.image: AppImages.pro2,
      AppStrings.name: AppStrings.classmatebook,
    },
    {AppStrings.image: AppImages.pro3, AppStrings.name: AppStrings.ballpen},
  ];

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isWeb(context); // <-- local variable

    return Scaffold(
      backgroundColor: AppColors.screencolor,

      //-------------------- TOP MARQUEE --------------------
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(36),
        child: SafeArea(
          child: Container(
            color: AppColors.primaryBlue,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: WebMarquee(
              text: "${AppStrings.minOrder}     " * 100,
              style: AppTextStyles.marquee(isWeb),
            ),
          ),
        ),
      ),

      body: _homeBody(isWeb),
    );
  }

  //---------------------- MAIN BODY ----------------------
  Widget _homeBody(bool isWeb) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchBox(isWeb),
          const SizedBox(height: 22),

          _slider(isWeb),
          const SizedBox(height: 25),

          _sectionTitle(AppStrings.explorecat, isWeb),

          const SizedBox(height: 12),

          _categoryList(isWeb),
          const SizedBox(height: 25),

          _productSection(AppStrings.stationary, products, isWeb),
          _productSection(AppStrings.toys, toys, isWeb),
          _productSection(AppStrings.ecofriendlyprod, products, isWeb),
          _productSection(AppStrings.babyproducts, products, isWeb),
          _productSection(AppStrings.giftitems, products, isWeb),
        ],
      ),
    );
  }

  //---------------------- SEARCH BOX ----------------------
  Widget _searchBox(bool isWeb) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.logo, height: 22),
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
          SvgPicture.asset(AppIcons.search_icon, width: 24, height: 24),
        ],
      ),
    );
  }

  //---------------------- SLIDER ----------------------
  Widget _slider(bool isWeb) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isWeb ? 20 : 12),
      child: AspectRatio(
        aspectRatio: isWeb ? 16 / 9 : 16 / 9, // <-- FIXED
        child: PageView.builder(
          controller: _pageController,
          itemCount: loopImages.length,
          itemBuilder: (_, i) {
            return Image.asset(
              loopImages[i],
              fit: BoxFit.cover, // <-- FIXED
            );
          },
        ),
      ),
    );
  }




  //---------------------- SECTION TITLE ----------------------
  Widget _sectionTitle(String text, bool isWeb) {
    return Text(text, style: AppTextStyles.sectionTitle(isWeb));
  }

  //---------------------- CATEGORY LIST ----------------------
  Widget _categoryList(bool isWeb) {
    return SizedBox(
      height: isWeb ? 140 : 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, i) {
          return Container(
            margin: const EdgeInsets.only(right: 18),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(isWeb ? 4 : 3), // border thickness
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: isWeb ? 40 : 30,
                    backgroundImage: AssetImage(
                      categories[i][AppStrings.icon]!,
                    ),
                  ),
                ),

                const SizedBox(height: 6),
                Text(
                  categories[i][AppStrings.name]!,
                  style: TextStyle(fontSize: isWeb ? 15 : 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //---------------------- PRODUCT SECTION ----------------------
  Widget _productSection(String title, List items, bool isWeb) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //---------------- Header ----------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isWeb ? 26 : 20,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlue,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MainLayout(
                      initialIndex: 0, // Home tab
                      screens: [
                        ProductListScreen(
                          title:title,
                          items: products, // pass your product list here
                        ),
                        const CartScreen(),
                        const WishlistScreen(),
                        const ProfileScreen(),
                      ],
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(AppIcons.rightarrow, width: 40, height: 40),
            ),




          ],
        ),
        const SizedBox(height: 15),

        //---------------- Product List ----------------
        SizedBox(
          height: isWeb ? 330 : 320,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: true,
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,    // 🔥 Web horizontal drag works
                PointerDeviceKind.trackpad,
              },
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (_, index) {
                return Container(
                  width: isWeb ? 220 : 150,
                  margin: const EdgeInsets.only(right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // ---------------- IMAGE FIX ----------------
                      isWeb
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          items[index][AppStrings.image],
                          height: 240,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                          : AspectRatio(
                        aspectRatio: 3 / 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            items[index][AppStrings.image],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        items[index][AppStrings.name],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.productName(isWeb),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Text("₹139.00", style: AppTextStyles.homeprice(isWeb)),
                          const SizedBox(width: 8),
                          Text("Rs.325.00", style: AppTextStyles.pricedrop(isWeb)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
