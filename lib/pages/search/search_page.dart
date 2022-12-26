import 'package:bebop_music/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTyping = false;

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                collapsedHeight: 50,
                toolbarHeight: 50,
                backgroundColor: backgroundColor,
                leadingWidth: 50,
                leading:
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                flexibleSpace: FlexibleSpaceBar(
                  
                  titlePadding: EdgeInsets.symmetric(vertical: 3, horizontal: 50),
                  title: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                        autofocus: true,
                        style: TextStyle(fontSize: 15, color: textColor),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.red,
                          border: borderStyle(),
                          focusedBorder: borderStyle()

                        )),
                  ),
                ),
                // title: TextField(
                //   autofocus: true,
                //   maxLines: 1,
                //   maxLength: 30,
                //   style: TextStyle(fontSize: 15, color: textColor),
                //   onChanged: (val) {
                //     isTyping = val.isEmpty ? true : false;
                //   },
                //   decoration: InputDecoration(
                //     isDense: true,
                //
                //     border: borderStyle(),
                //     // focusedBorder: borderStyle(),
                //    
                //   ),
                // ),
              )
            ];
          },
          body: SizedBox()),
    );
  }

  borderStyle() => OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(100),
      );
}
