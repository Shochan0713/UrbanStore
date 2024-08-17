import 'package:flutter/material.dart';
import 'package:urbanstore/view/user_management/UserInfo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final List<Widget> actions;
  const CustomAppBar({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.list),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: const Center(
          child: Text('URBAN Store',
              style: TextStyle(fontWeight: FontWeight.bold))),
      // actions: actions,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Userinfo(),
                ),
              );
            },
            icon: const Icon(Icons.person))
      ],
      backgroundColor: Colors.cyan,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => throw UnimplementedError();
}
