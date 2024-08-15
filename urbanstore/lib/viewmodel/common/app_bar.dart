import 'package:flutter/material.dart';
import 'package:urbanstore/view/user_management/UserInfo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final List<Widget> actions;
  const CustomAppBar({super.key, required this.title, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.list),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Center(
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold))),
      // actions: actions,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Userinfo(),
                ),
              );
            },
            icon: Icon(Icons.person))
      ],
      backgroundColor: Colors.cyan,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
