import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../screens/details_screen.dart';
import '../../theme/typography.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final String task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(title: task),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                RoundCheckBox(
                  onTap: (d) {},
                  size: 25,
                  checkedColor: Theme.of(context).colorScheme.primary,
                  checkedWidget: Icon(
                    Icons.check_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  task,
                  style: AppTypography.subtitle2,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "10:00 AM",
                  style: AppTypography.caption,
                ),
                Image.asset(
                  "assets/icons/more.png",
                  fit: BoxFit.cover,
                  width: 25,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
