import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:task_mate/data/models/task.dart';

import '../../screens/details_screen.dart';
import '../../theme/typography.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.onLongPress,
    required this.onCheckboxTapped,
  });

  final Task task;
  final void Function(Task) onLongPress;
  final Function(bool?) onCheckboxTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(title: task.name),
          ),
        );
      },
      onLongPress: () {
        onLongPress(task);
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
                  onTap: (d) {
                    task.updateTask(d ?? false);
                    onCheckboxTapped(d);
                  },
                  size: 25,
                  checkedColor: Theme.of(context).colorScheme.primary,
                  checkedWidget: Icon(
                    Icons.check_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  isChecked: task.isCompleted,
                ),
                const SizedBox(width: 20),
                Text(
                  task.name,
                  style: AppTypography.subtitle2,
                ),
              ],
            ),
            Text(
              "10:00 AM",
              style: AppTypography.caption,
            ),
          ],
        ),
      ),
    );
  }
}
