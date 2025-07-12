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
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withAlpha((0.1 * 255).toInt(),),
                                spreadRadius: 2,
                                blurRadius: 6,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            ImagesIconApp.Menu,
                            width: 18,
                            height: 18,
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
                left: 30,
                // , right: 30
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    30,
                    (index) => Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26.withAlpha(
                              (0.1 * 255).toInt(),
                            ),
                            spreadRadius: 2,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /////////////////////////// Icon
                          SvgPicture.asset(ImagesIconApp.Menu, width: 18),
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
                              Text(
                                '234 item',
                                style: GoogleFonts.robotoCondensed(
                                  fontSize: Fonts.bodyMedium,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
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
        ],
      ),
    );
  }
}
