import 'package:flutter/material.dart';

import '../../theme/typography.dart';
import 'bottom_dialog.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const BottomDialog();
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
