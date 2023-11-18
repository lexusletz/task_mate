import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/typography.dart';
import 'bottom_dialog.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
    required this.onPressed,
    required this.controller,
  });

  final Function onPressed;
  final Rx<TextEditingController> controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomDialog(
              onPressed: onPressed,
              controller: controller,
            );
          },
        );
      },
      label: Text(
        "New Task",
        style: AppTypography.button,
      ),
      icon: Image.asset(
        "assets/icons/add_task.png",
        fit: BoxFit.cover,
        width: 25,
      ),
    );
  }
}
