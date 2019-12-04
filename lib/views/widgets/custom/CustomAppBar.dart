import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final TabBar tabBar;

  const CustomAppBar({
    Key key,
    @required this.height,
    @required this.tabBar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: EdgeInsets.all(30),
            child: AppBar(
              title: Container(
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.verified_user),
                  onPressed: () => {},
                ),
              ],
              bottom:tabBar,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}