import 'package:bebop_music/share_widgets/search_appbar.dart';
import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTyping = false;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: searchAppBar(
            isSearchPage: true, buildContext: context, onPress: () {}),
        // AppBar(
        //   elevation: 0,
        //   toolbarHeight: 150.sp,
        //   backgroundColor: backgroundColor,
        //   leadingWidth: 35,
        //   leading: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 6),
        //     child: ,
        //   ),
        //   title: Container(
        //     margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
        //     padding: EdgeInsets.only(left: 40.sp, right: 20.sp),
        //     height: 110.sp,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //             begin: Alignment.centerLeft,
        //             end: Alignment.centerRight,
        //             colors: [
        //               secondaryColor.withAlpha(150),
        //               secondaryColor.withAlpha(100),
        //               primaryColor.withAlpha(100)
        //             ]),
        //         borderRadius: BorderRadius.circular(60)),
        //     child: TextField(
        //       maxLength: 35,
        //       autofocus: true,
        //       style: textFiledStyle,
        //       decoration: InputDecoration(
        //         counterText: "",
        //         hintText: "Search songs or album ",
        //         hintStyle: textFiledStyle.copyWith(color: textLightColor),
        //         suffixIcon: Icon(Icons.close, color: textColor, size: 65.sp,),
        //           contentPadding: EdgeInsets.symmetric(vertical: 10.sp),
        //           border: borderStyle(),
        //           focusedBorder: borderStyle()),
        //     ),
        //   ),
        // ),

        body: Column(
          children: [],
        ));
  }

  borderStyle() =>
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
}
