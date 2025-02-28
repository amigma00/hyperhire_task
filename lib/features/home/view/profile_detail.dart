import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyperhire_task/core/constants/colors.dart';
import 'package:hyperhire_task/core/utils/extensions.dart';
import 'package:hyperhire_task/core/utils/text_style_util.dart';

class ProfileDetail extends StatefulWidget {
  final String image, name;
  const ProfileDetail({super.key, required this.image, required this.name});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(),
          bottomNavigationBar: bottomWidget(),
          body: ListView(
            children: [
              24.kheightBox,
              headerProfile(),
              28.kheightBox,
              Divider(thickness: 14, height: 14, color: AppColors.bgColor),
              ListTile(
                title: Row(
                  children: [
                    '작성한 리뷰'.notoSansKr500(16),
                    '총 35개'.notoSansKr400(12),
                  ],
                ),
                trailing: SizedBox(
                  width: 80,
                  child: DropdownButtonFormField(
                    value: 'KOR',
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
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
                          12,
                          color: AppColors.footerColor,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ENG',
                        child: 'ENG'.notoSansKr400(
                          12,
                          color: AppColors.footerColor,
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
              Divider(),
              20.kheightBox,
              productDetail(),
              8.kheightBox,
              Divider().paddingSymmetric(horizontal: 16),
              14.kheightBox,
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                minTileHeight: 0,
                minVerticalPadding: 0,
                dense: true,
                leading: CircleAvatar(
                  radius: 17,
                  backgroundImage: AssetImage(widget.image),
                ),
                horizontalTitleGap: 6,
                title: widget.name.notoSansKr500(14),
                subtitle: Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star_rounded,
                        size: 12,
                        color:
                            index == 4
                                ? AppColors.borderColor
                                : AppColors.yellow,
                      ),
                    ),

                    '2022.12.09'.notoSansKr400(10),
                  ],
                ),
                trailing: SvgPicture.asset('assets/svg/bookmark.svg'),
              ),
              26.kheightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                    (index) => '“가격 저렴해요”'
                        .notoSansKr700(10)
                        .paddingOnly(right: 20, left: index == 0 ? 16 : 0),
                  ),
                ),
              ),
              18.kheightBox,
              reviews().paddingSymmetric(horizontal: 16),
            ],
          ),
        ),
      ),
    );
  }

  Column reviews() {
    return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    7.kwidthtBox,
                    SvgPicture.asset('assets/svg/bolt.svg'),
                    10.kwidthtBox,
                    Expanded(
                      child:
                          '멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.'
                              .notoSansKr400(14),
                    ),
                  ],
                ),
                18.kheightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    7.kwidthtBox,
                    SvgPicture.asset(
                      'assets/svg/bolt.svg',
                      color: AppColors.borderColor,
                    ),
                    10.kwidthtBox,
                    Expanded(
                      child: Column(
                        children: [
                          '3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.'
                              .notoSansKr400(14),
                          18.kheightBox,
                          Row(
                            children: List.generate(
                              3,
                              (index) => Image.asset(
                                [
                                  'assets/images/review1.png',
                                  'assets/images/review2.png',
                                  'assets/images/review3.png',
                                ][index],
                              ).paddingOnly(right: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
  }

  Row productDetail() {
    return Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  height: 110,
                  width: 110,
                  child: Image.asset(
                    'assets/images/amd.png',
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                // 14.kwidthtBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'AMD 라이젠 5 5600X 버미어'.notoSansKr700(14),
                    '정품 멀티팩'.notoSansKr500(14),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star_rounded,
                            color:
                                index == 4
                                    ? AppColors.borderColor
                                    : AppColors.yellow,
                          ),
                        ),
                        8.kwidthtBox,
                        '4.07'.notoSansKr500(18),
                      ],
                    ),
                  ],
                ),
              ],
            );
  }

  Column headerProfile() {
    return Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      widget.image,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                12.kheightBox,
                widget.name.notoSansKr500(20, textAlign: TextAlign.center),
                2.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/fvrt.svg',
                      height: 13,
                      width: 16,
                    ),
                    5.kwidthtBox,
                    '골드'.notoSansKr500(14, color: AppColors.yellow),
                  ],
                ),
                18.kheightBox,
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.chipColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),

                    child: '조립컴 업체를 운영하며 리뷰를 작성합니다.'.notoSansKr400(14),
                  ),
                ),
              ],
            );
  }

  Column bottomWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider().paddingSymmetric(horizontal: 16),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          minTileHeight: 0,
          minVerticalPadding: 0,
          leading: SvgPicture.asset(
            'assets/svg/comment.svg',
            height: 12,
            width: 12,
          ),
          horizontalTitleGap: 0,
          title: '댓글 달기..'.notoSansKr400(10),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 1,
      automaticallyImplyLeading: true,
      title: Column(
        children: ['랭킹 1위'.notoSansKr400(10), '베스트 리뷰어'.notoSansKr500(16)],
      ),
    );
  }
}
