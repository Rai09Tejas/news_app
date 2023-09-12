import 'package:flutter/material.dart';
import 'package:quantum_task/utils/assets.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      elevation: 0,
      backgroundColor: Colors.red,
      title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            logo,
            height: 120,
            width: 120,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
