import 'package:aaqaqir_tirganin/app/config/Assets/images.dart';
import 'package:aaqaqir_tirganin/app/config/Fonts/fonts.dart';
import 'package:aaqaqir_tirganin/app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_staff_screen_controller.dart';

class HomeStaffScreenView extends GetView<HomeStaffScreenController> {
  const HomeStaffScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.Grey9,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 15,
                    left: 40,
                    // , right: 30
                  ),
                  /////////////////////////////////////////////////////////////////////////////// Text Icon Menu and Textfilde
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Menu');
                        },
                        child: Card(
                          elevation: 6,
                          color: Colors.white,
                          shadowColor: Colors.black26,
                          margin: EdgeInsets.all(10),
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(
                              ImagesIconApp.Menu,
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 10,
                        shadowColor: Colors.black26,
                        child: SizedBox(
                          width: Get.width / 1.8,
                          height: 40,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.inter(
                              fontSize: Fonts.headlineMedium,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              filled: true,
                              hintText: 'Search Product here'.tr,
                              hintStyle: GoogleFonts.roboto(
                                fontSize: Fonts.headlineMedium,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                              prefixIcon: IconButton(
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  print("search");
                                },
                                icon: SvgPicture.asset(
                                  ImagesIconApp.Search,
                                  width: 20,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ////////////////////////////////////////////////// list horizontal
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                bottom: 15,
                left: 40,
                // , right: 30
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    30,
                    (index) => InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print(index);
                        // controller.selectIndexhorizontal.value = index;
                      },
                      child: Container(
                        width: 100,
                        height: 110,
                        padding: EdgeInsets.all(13),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              controller.selectIndexhorizontal.value == index
                                  ? ColorsApp
                                      .Colors_gradientSplachscreen2.withAlpha(
                                    (0.1 * 255).toInt(),
                                  )
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26.withAlpha(
                                (0.1 * 255).toInt(),
                              ),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /////////////////////////// Icon
                            SvgPicture.asset(
                              ImagesIconApp.Menu,
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                            ),
                            ///////////////////////////// text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'All',
                                  style: GoogleFonts.robotoCondensed(
                                    fontSize: Fonts.bodyLarge,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "234",
                                        style: GoogleFonts.robotoCondensed(
                                          fontSize: Fonts.bodyMedium,
                                          fontWeight: FontWeight.w500,
                                          color: ColorsApp.Grey2,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " item",
                                        style: GoogleFonts.robotoCondensed(
                                          fontSize: Fonts.bodyMedium,
                                          fontWeight: FontWeight.w500,
                                          color: ColorsApp.Grey2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ///////////////////////////////////////////////// list viwe Gride
          // SliverGrid(
          //   delegate: SliverChildBuilderDelegate((context, Index) {
          //     return 
          //   }, childCount: 1),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //   ),
          // ),
          SliverToBoxAdapter(
            //////////////////////////////////////// item
            child: Center(
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //////////////////////////////////// image
                      Material(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior:Clip.antiAlias,
                        child: Image.network(
                          "https://c8.alamy.com/comp/KHG386/colorful-trees-lined-the-shores-of-patricia-lake-at-jasper-national-KHG386.jpg",
                          fit: BoxFit.fill,
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
