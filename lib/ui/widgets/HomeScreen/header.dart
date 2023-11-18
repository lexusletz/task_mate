import 'package:flutter/material.dart';

import '../../theme/typography.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back, Jordy 👋",
              style: AppTypography.headline1,
            ),
            Text(
              "You have X pending tasks",
              style: AppTypography.bodyText2,
            )
          ],
        ),
        Row(
          children: [
            Image.asset(
              "assets/icons/notification.png",
              fit: BoxFit.cover,
              width: 25,
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).colorScheme.primary,
              backgroundImage: const NetworkImage(
                "https://xsgames.co/randomusers/avatar.php?g=male",
              ),
            ),
          ],
        )
      ],
    );
  }
}
