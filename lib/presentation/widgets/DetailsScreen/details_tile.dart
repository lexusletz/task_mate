import 'package:flutter/material.dart';

import '../../theme/typography.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile(
      {super.key, required this.detailsName, required this.detailsValue});

  final String detailsName;
  final String detailsValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            detailsName,
            style: AppTypography.headline2.copyWith(fontSize: 18),
          ),
          Text(
            detailsValue,
            style: AppTypography.bodyText1,
          ),
        ],
      ),
    );
  }
}
