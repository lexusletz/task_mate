import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_mate/ui/theme/typography.dart';
import 'package:task_mate/ui/widgets/HomeScreen/app_bar.dart';

import '../widgets/HomeScreen/Fab.dart';
import '../widgets/HomeScreen/header.dart';
import '../widgets/HomeScreen/task_tile.dart';
import '../widgets/HomeScreen/title_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        statusBarColor: Theme.of(context).colorScheme.background,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: const Fab(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Header(),

              SizedBox(height: 20),

              // Taskt to do today
              TitleTile(title: "Task for today"),

              TaskTile(task: "Primera Tarea"),

              // Task to do tomorrow
              TitleTile(title: "Task for tomorrow"),

              TaskTile(task: "Primera Tarea"),
              TaskTile(task: "Primera Tarea"),
              TaskTile(task: "Primera Tarea"),

              TitleTile(title: "Completed"),

              TaskTile(task: "Task Completed"),
              TaskTile(task: "Task Completed"),
            ],
          ),
        ),
      ),
    );
  }
}
