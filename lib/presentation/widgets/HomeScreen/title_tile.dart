import 'package:flutter/material.dart';

import '../../theme/typography.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: AppTypography.headline1,
      ),
    );
  }
}
