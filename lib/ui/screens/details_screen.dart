import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_mate/ui/theme/typography.dart';
import 'package:task_mate/ui/widgets/DetailsScreen/details_tile.dart';
import 'package:task_mate/ui/widgets/HomeScreen/title_tile.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.primary,
        statusBarColor: Theme.of(context).colorScheme.primary,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleTile(title: "Details:"),
            const SizedBox(height: 10),
            DetailsTile(
              detailsName: "Name:",
              detailsValue: title,
            ),
            const DetailsTile(
              detailsName: "Date:",
              detailsValue: "Today, 10:00 AM",
            ),
            const DetailsTile(
              detailsName: "Completed:",
              detailsValue: "False",
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    "Complete",
                    style: AppTypography.button,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
