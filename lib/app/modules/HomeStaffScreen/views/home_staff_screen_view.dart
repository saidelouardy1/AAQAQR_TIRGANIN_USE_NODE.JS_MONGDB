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
                  /////////////////////////////////////////////////////////////////////////////// Text Icon Menu
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
                      //////////////////////////////////////////////////////////////// text filde
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
          //////////////////////////////////////////////////  Item All Catigory
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                bottom: 15,
                left: 40,
                // , right: 30
              ),
              child: Row(
                children: [
                   //////////////////////////////////////////////////  Item All Catigory
                   Obx(
                    ()=>InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        controller.selectIndexhorizontal.value = -1;
                        print('go to see all catigory');
                      },
                      child: Container(
                        width: 100,
                        height: 110,
                        padding: EdgeInsets.all(13),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              controller.selectIndexhorizontal.value == -1
                                  ? ColorsApp.Colors_gradientSplachscreen2.withAlpha( (0.1 * 255).toInt())
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
                              ImagesIconApp.Category,
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
                  //////////////////////////////////////////////////  List horizontal present catigory
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          30,
                          (index) => Obx(
                            ()=>InkWell(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              print(index);
                              controller.selectIndexhorizontal.value = index;
                              print( controller.selectIndexhorizontal.value);
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
                                    ImagesIconApp.Category,
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
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ///////////////////////////////////////////////// list viwe Gride
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, Index) {
              return Center(
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //////////////////////////////////// image item
                      Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          ImagesIconApp.background1,
                          fit: BoxFit.fill,
                          height: 130,
                        ),
                      ),
                      ///////////////////// space
                      space(),
                      //////////////////////////////////// title item
                      Text(
                        'This app is sotr of materiale build and is developp by ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: Fonts.titleSmall,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ///////////////////// space
                      space(),
                      //////////////////////////////////// Prix withe quantity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///////////////////:::: prix
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "123",
                                  style: GoogleFonts.inter(
                                    fontSize: Fonts.headlineMedium,
                                    color:
                                        ColorsApp.Colors_gradientSplachscreen2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: " HD",
                                  style: GoogleFonts.inter(
                                    fontSize: Fonts.headlineMedium,
                                    color:
                                        ColorsApp.Colors_gradientSplachscreen2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ///////////////////:::: qauntity
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: SvgPicture.asset(
                                  ImagesIconApp.buy,
                                  width: 16,
                                  colorFilter: ColorFilter.mode(ColorsApp.Colors_gradientSplachscreen2, BlendMode.srcIn),
                                ),
                              ),
                              Text(
                                '112',
                                style: GoogleFonts.inter(
                                  fontSize: Fonts.headlineMedium,
                                  color: ColorsApp.Colors_gradientSplachscreen2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ///////////////////// space
                      space(),

                      /////////////////////////////////////// button add prodact with quantite
                      InkWell(
                        onTap: () {
                          print('add product');
                        },
                        child: Container(
                          width: Get.width,
                          padding: EdgeInsets.all(6),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorsApp
                                .Colors_gradientSplachscreen2.withAlpha(
                              (0.1 * 255).toInt(),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //////////////////////////////////////////////////////// icon minus
                              IconButton(
                                onPressed: () {
                                  print("Minus");
                                },
                                icon: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsApp.Colors_gradientSplachscreen2.withAlpha((0.5 * 255).toInt()),
                                  ),
                                  child: SvgPicture.asset(
                                    ImagesIconApp.Minus,
                                    width: 18,
                                    height: 18,
                                    colorFilter: ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                              ),
                              ///////////////////////////////////////////////////: quantity of product
                              Text(
                                '0',
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: Fonts.headlineMedium,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ////////////////////////////////////////////////////// button plus
                              IconButton(
                                onPressed: () {
                                  print("plus");
                                },
                                icon: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsApp.Colors_gradientSplachscreen2.withAlpha((0.5 * 255).toInt()),
                                  ),
                                  child: SvgPicture.asset(
                                    ImagesIconApp.Add,
                                    width: 18,
                                    height: 18,
                                    colorFilter: ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: Get.width,
                        //   padding: EdgeInsets.all(6),
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     color: ColorsApp.Colors_gradientSplachscreen2.withAlpha((0.1 * 255).toInt()),
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: Text(
                        //     'Add',
                        //     style: GoogleFonts.inter(
                        //       color: Colors.black,
                        //       fontSize: Fonts.headlineMedium,
                        //       fontWeight: FontWeight.w600
                        //     ),
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            }, 
            //////////////////////////// count the product
            childCount: 1
            ),
            //////////////////////////// controlle space 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
        ],
      ),
    );
  }

  ///////////////////////////////////////// widget space
  Widget space() {
    return SizedBox(height: 8);
  }
}
