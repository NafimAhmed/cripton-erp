import 'package:flutter/material.dart';

import '../config/app_assets.dart';
import '../utils/color.dart';

class PrimaryNetworkImage extends StatelessWidget {
  const PrimaryNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  final String imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(imageUrl),
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            AppAssets.PROFILE_DEMO,
            color: Colors.white,
            fit: BoxFit.fitHeight,
          );
        },
      ),
    );
  }
}

class RoundedNetworkImage extends StatelessWidget {
  const RoundedNetworkImage({
    super.key,
    required this.imageUrl,
    this.radius = 16,
    this.border = 0,
    this.borderColor = PRIMARY_SWATCH,
  });

  final String imageUrl;
  final double radius;
  final int border;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: borderColor,
      child: ClipOval(
        child: Image.network(imageUrl,
            fit: BoxFit.cover,
            width: (radius * 2) - (border * 4),
            height: (radius * 2) - (border * 4),
            errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            AppAssets.PROFILE_DEMO,
            color: Colors.white,
            fit: BoxFit.cover,
          );
        }),
      ),
    );
  }
}
