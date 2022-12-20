import 'package:bebop_music/utils/app_colors.dart';
import 'package:bebop_music/utils/app_thems.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70), child: topBar()),
    );
  }

  Widget topBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: backgroundLightColor,
        leading: Container(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              "assets/icons/menu_icon.png",
              fit: BoxFit.cover,
            )),
            leadingWidth: 50,
        title: const SearchBar(),
      );
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
      color: secondaryLightColor,
        borderRadius: BorderRadius.circular(20)
      ),
      // height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Icon(Icons.search, size: 20),
            const SizedBox(width: 5),
            Text("Search Songs and Album ...", style: body.copyWith(color: textLightColor))
          ],
        ),
      ),
    );
  }
}
