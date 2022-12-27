import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSizeWidget searchAppBar(
        {required VoidCallback onPress,
        required BuildContext buildContext,
        required bool isSearchPage}) =>
    AppBar(
      elevation: 0,
      toolbarHeight: 150.sp,
      backgroundColor: backgroundColor,
      leadingWidth: 110.sp,
      leading: Padding(
          padding: EdgeInsets.only(left: 45.sp),
          child: isSearchPage ? leadingBackBtn(buildContext) : leadingMenuIcon()),
      title: GestureDetector(
        onTap: onPress,
        child: Container(
            margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
            padding: EdgeInsets.only(left: 40.sp, right: 20.sp),
            height: 110.sp,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      secondaryColor.withAlpha(150),
                      secondaryColor.withAlpha(100),
                      primaryColor.withAlpha(100)
                    ]),
                borderRadius: BorderRadius.circular(60)),
            child: isSearchPage ? searchTextFiled() : searchTitle()),
      ),
    );

borderStyle() =>
    const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));

Widget searchTitle() => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(FontAwesomeIcons.magnifyingGlass,
            size: 50.sp, color: textLightColor),
        SizedBox(width: 25.w),
        SizedBox(
          width: 360.sp,
          child: Text("Search Songs and Album",
              style: heading3.copyWith(
                  color: textLightColor, overflow: TextOverflow.ellipsis)),
        ),
      ],
    );

Widget searchTextFiled() => TextField(
      maxLength: 35,
      autofocus: true,
      style: textFiledStyle,
      decoration: InputDecoration(
        counterText: "",
        hintText: "Search",
        hintStyle: textFiledStyle.copyWith(color: textLightColor),
        suffixIcon: Icon(Icons.close, color: textColor, size: 65.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 10.sp),
        border: borderStyle(),
        focusedBorder: borderStyle(),
        enabledBorder: borderStyle(),
      ),
    );

leadingMenuIcon() =>
    Icon(FontAwesomeIcons.barsStaggered, size: 60.sp, color: textColor);

leadingBackBtn(BuildContext context) => IconButton(
    onPressed: () => Navigator.pop(context),
    icon: Icon(
      Icons.arrow_back,
      size: 65.sp,
    ));
