import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperhire_task/core/constants/colors.dart';
import 'package:hyperhire_task/core/constants/image_constant.dart';
import 'package:hyperhire_task/core/utils/extensions.dart';
import 'package:hyperhire_task/core/utils/text_style_util.dart';
import 'package:hyperhire_task/features/home/view/profile_detail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int carousalIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.bgColor,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            leadingWidth: 100,
            elevation: 1,
            surfaceTintColor: Colors.transparent,
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'LOGO',
                style: GoogleFonts.notoSansKr(
                  fontSize: 24,
                  color: AppColors.appBarColor,
                ),
              ),
            ),
          ),
          body: ListView(
            // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              20.kheightBox,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  gradient: LinearGradient(
                    colors: [Color(0xFF74FBDE), Color(0xFF3C41BF)],
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '검색어를 입력하세요',
                    hintStyle: GoogleFonts.notoSansKr(
                      fontWeight: FontWeight.w400,
                      color: AppColors.hintText,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 24,
                      maxWidth: 44,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/svg/search_icon.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              30.kheightBox,
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          carousalIndex = index;
                        });
                      },
                      autoPlay: true,
                      viewportFraction: 1,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    ),
                    items: List.generate(ImageConstant.carousalImages.length, (
                      index,
                    ) {
                      return Image.asset(
                        ImageConstant.carousalImages[index],
                        fit: BoxFit.cover,
                        width: 1000,
                      );
                    }),
                  ),
                  AnimatedSmoothIndicator(
                    effect: ExpandingDotsEffect(
                      dotHeight: 4,
                      dotWidth: 4,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withValues(alpha: .5),
                    ),
                    activeIndex: carousalIndex,
                    count: ImageConstant.carousalImages.length,
                  ).paddingOnly(bottom: 10),
                ],
              ),

              ListTile(
                title: '제일 핫한 리뷰를 만나보세요'.notoSansKr400(12),
                subtitle: '리뷰️  랭킹⭐ top 3'.notoSansKr500(
                  18,
                  color: Colors.black,
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
              ...List.generate(ImageConstant.topProducts.length, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        height: 110,
                        width: 110,
                        child: Stack(
                          children: [
                            Image.asset(
                              ImageConstant.topProducts[index]['image'],
                              height: double.infinity,
                              width: double.infinity,
                            ),
                            SvgPicture.asset(
                              [
                                'assets/svg/top1.svg',
                                'assets/svg/top2.svg',
                                'assets/svg/top3.svg',
                              ][index],
                              height: 15,
                              width: 19,
                            ).paddingAll(6),
                          ],
                        ),
                      ),
                      8.kwidthtBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageConstant.topProducts[index]['title']
                                .toString()
                                .notoSansKr700(
                                  14,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                            ...List.generate(
                              ImageConstant
                                  .topProducts[index]['subtitle']
                                  .length,
                              (ind) =>
                                  '•\t${ImageConstant.topProducts[index]['subtitle'][ind]}'
                                      .notoSansKr400(
                                        12,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                      .paddingOnly(left: 6),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: AppColors.yellow,
                                  size: 15,
                                ),
                                3.kwidthtBox,
                                ImageConstant.topProducts[index]['rate']
                                    .toString()
                                    .notoSansKr700(10, color: AppColors.yellow),
                                2.kwidthtBox,
                                '(${ImageConstant.topProducts[index]['totRatings']})'
                                    .notoSansKr700(
                                      10,
                                      color: AppColors.borderColor,
                                    ),
                              ],
                            ),
                            Row(
                              children: List.generate(
                                ImageConstant.topProducts[index]['tag'].length,
                                (ind) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.chipColor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 5,
                                    ),
                                    margin: EdgeInsets.only(right: 4),
                                    child: ImageConstant
                                        .topProducts[index]['tag'][ind]
                                        .toString()
                                        .notoSansKr400(11),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
              12.kheightBox,
              Divider(thickness: 14, height: 14, color: AppColors.bgColor),
              18.kheightBox,
              '골드 계급 사용자들이예요'
                  .notoSansKr400(12)
                  .paddingSymmetric(horizontal: 16),
              '베스트 리뷰어 🏆 Top10'
                  .notoSansKr500(18)
                  .paddingSymmetric(horizontal: 16),
              18.kheightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    ImageConstant.catImages.length,
                    (index) => Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap:
                                  () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ProfileDetail(
                                            name: 'Name ${index + 1}',
                                            image:
                                                ImageConstant.catImages[index],
                                          ),
                                    ),
                                  ),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    index == 0
                                        ? AppColors.yellow
                                        : Colors.transparent,
                                child: CircleAvatar(
                                  radius: 31,

                                  backgroundImage: AssetImage(
                                    ImageConstant.catImages[index],
                                  ),
                                ),
                              ),
                            ),
                            6.kheightBox,
                            'Name ${index + 1}'.notoSansKr400(14),
                          ],
                        ),
                        if (index == 0)
                          Positioned(
                            left: 5,
                            top: -12,
                            child: SvgPicture.asset(
                              'assets/svg/fvrt.svg',
                              height: 13,
                              width: 16,
                            ),
                          ),
                      ],
                    ).paddingOnly(
                      left: index == 0 ? 16 : 0,
                      right: 15,
                      top: 20,
                    ),
                  ),
                ),
              ),
              28.kheightBox,
              Container(
                color: AppColors.bgColor,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.kheightBox,
                    'LOGO Inc.'.notoSansKr500(14, color: AppColors.footerColor),
                    12.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        '회사 소개'.notoSansKr400(13, color: AppColors.footerColor),
                        '|'.notoSansKr400(13, color: AppColors.footerColor),
                        '인재 채용'.notoSansKr400(13, color: AppColors.footerColor),
                        '|'.notoSansKr400(13, color: AppColors.footerColor),
                        '기술 블로그'.notoSansKr400(
                          13,
                          color: AppColors.footerColor,
                        ),
                        '|'.notoSansKr400(13, color: AppColors.footerColor),
                        '리뷰 저작권'.notoSansKr400(
                          13,
                          color: AppColors.footerColor,
                        ),
                      ],
                    ),
                    18.kheightBox,
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/send.svg',
                          height: 16,
                          width: 16,
                        ),
                        'review@logo.com'.notoSansKr400(
                          13,
                          color: AppColors.footerColor,
                        ),
                        Spacer(),
                        SizedBox(
                          width: 80,
                          child: DropdownButtonFormField(
                            value: 'KOR',
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 7,
                              ),
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.footerColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.footerColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors.footerColor,
                                ),
                              ),
                            ),
                            isDense: true,
                            items: [
                              DropdownMenuItem(
                                value: 'KOR',
                                child: 'KOR'.notoSansKr400(
                                  10,
                                  color: AppColors.footerColor,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'ENG',
                                child: 'ENG'.notoSansKr400(
                                  10,
                                  color: AppColors.footerColor,
                                ),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    14.kheightBox,
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: AppColors.footerColor,
                    ).paddingSymmetric(horizontal: 16),
                    14.kheightBox,
                    '@2022-2022 LOGO Lab, Inc. (주)아무개  서울시 강남구'.notoSansKr400(
                      10,
                      color: AppColors.footerColor,
                    ),
                    24.kheightBox,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
