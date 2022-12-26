import 'package:bebop_music/share_widgets/play_btn.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaylistCardMin extends StatelessWidget {
  const PlaylistCardMin({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 270.w;
    return Container(
      width: size,
      height: 300,
      margin: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
      decoration: BoxDecoration(
          color: primaryLightColor, borderRadius: BorderRadius.circular(40.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.r),
        child: Stack(
          children: [
            SizedBox(
              width: size,
              height: size,
              child: Image.asset('assets/logo.png', fit: BoxFit.fitHeight),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size * 0.4,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black54,
                    ])),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size * 0.6,
                      child: Text("play list name",
                          style: tileSubTitleBold.copyWith(color: textColor)),
                    ),
                    PlayButton(
                        bgColor: textColor, onPress: () {}, btnSize: 60.sp)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistCardMax extends StatelessWidget {
  final String titleName;
  final String subTitleName;
  final String cardDesc;
  final double cardSize;
  const PlaylistCardMax(
      {super.key,
      required this.titleName,
      required this.subTitleName,
      required this.cardDesc,
      required this.cardSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: cardSize,
          height: cardSize,
          margin: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
          decoration: BoxDecoration(
              color: primaryLightColor,
              borderRadius: BorderRadius.circular(40.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(25.sp),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert,
                            color: textColor, size: 70.sp)),
                  ),
                ),
                // SizedBox(
                //   width: cardSize,
                //   height: cardSize,
                //   // child: Image.asset('assets/images/default_img.jpg',
                //   child: Image.asset('assets/images/album.jpg',
                //       fit: BoxFit.fitHeight),
                // ),
                cardDesc.isEmpty
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: cardSize * 0.3,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                Colors.black87,
                              ])),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.sp, horizontal: 30.sp),
                          child: SizedBox(
                            width: cardSize * 0.9,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: cardSize * 0.6,
                                  child: Text(cardDesc,
                                      // "play list name",
                                      maxLines: 2,
                                      style: heading2.copyWith(
                                          fontSize: 40.sp,
                                          overflow: TextOverflow.ellipsis,
                                          height: 1.2,
                                          color: textColor,
                                          fontWeight: FontWeight.w600)),
                                ),
                                const Spacer(),
                                PlayButton(
                                    bgColor: textColor,
                                    onPress: () {},
                                    btnSize: 80.sp),
                              ],
                            ),
                          ),
                        ),
                      )
                    
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40.sp, 10.sp, 40.sp, 50.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleName,
                  // "Artists Name with full details",
                  maxLines: 2,
                  style: tileTitle.copyWith(
                      overflow: TextOverflow.ellipsis, height: 1.2)),
              verticalSubSpace(),
              subTitleName.isNotEmpty
                  ? Text(subTitleName, style: tileSubTitle)
                  : const Center()
              // Text(subTitleName,)
            ],
          ),
        )
      ],
    );
  }
}
