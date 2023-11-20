import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/models/task.dart';
import '../controllers/home_controller.dart';
import '../theme/typography.dart';
import '../widgets/HomeScreen/Fab.dart';
import '../widgets/HomeScreen/header.dart';
import '../widgets/HomeScreen/task_tile.dart';
import '../widgets/HomeScreen/title_tile.dart';

class HomeScreen extends GetView<HomeController> {
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
      floatingActionButton: Fab(
        onPressed: () => controller.addTask(),
        controller: controller.taskController,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Header(
                username: controller.username,
                photoUrl: controller.photoUrl,
              ),

              const SizedBox(height: 20),

              // Taskt to do today
              const TitleTile(title: "Task for today"),

              StreamBuilder<QuerySnapshot>(
                stream: controller.getTodayTasks(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return snapshot.data!.docs.isNotEmpty
                      ? Wrap(
                          children: snapshot.data!.docs.map(
                            (DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              Task task = Task.fromJson(data);
                              return TaskTile(
                                task: task,
                                onLongPress: (task) =>
                                    controller.deleteTask(task),
                                onCheckboxTapped: (d) =>
                                    controller.completeTask(task),
                              );
                            },
                          ).toList(),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              "No tasks to do today",
                              style: AppTypography.bodyText1,
                            ),
                          ),
                        );
                },
              ),
              // Tasks to do tomorrow

              const TitleTile(title: "Completed"),

              StreamBuilder<QuerySnapshot>(
                stream: controller.getCompletedTasks(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return snapshot.data!.docs.isNotEmpty
                      ? SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: snapshot.data!.docs.map(
                              (DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                Task task = Task.fromJson(data);
                                return TaskTile(
                                  task: task,
                                  onLongPress: (task) =>
                                      controller.deleteTask(task),
                                  onCheckboxTapped: (d) =>
                                      controller.completeTask(task),
                                );
                              },
                            ).toList(),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              "No completed tasks",
                              style: AppTypography.bodyText1,
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
