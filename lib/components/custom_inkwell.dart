import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class CustomInkWell extends StatelessWidget {
  final Color? color;
  final String? image;
  final String? title;
  final double? width;
  final Widget? child;
  final double? height;
  final Color? textColor;
  final Color? cardColor;
  final double elevation;
  final bool isNetworkImg;
  final VoidCallback onTap;
  final ShapeBorder? shape;
  final double borderRadius;
  final Alignment textAlignment;
  final Color textBackgroundColor;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const CustomInkWell({
    super.key,
    required this.onTap,
    this.color,
    this.image,
    this.title,
    this.child,
    this.shape,
    this.cardColor,
    this.height = 128,
    this.elevation = 0,
    this.borderRadius = 8,
    this.isNetworkImg = false,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.all(8),
    this.textAlignment = Alignment.topLeft,
    this.textBackgroundColor = Colors.black45,
    this.margin = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      color: cardColor,
      margin: margin,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            if (image != null) ...[_backgroundImageWidget()],
            if (title != null) ...[_titleWidget()],
            if (child != null) ...[child!],
            Positioned.fill(child: Material(color: Colors.transparent, child: InkWell(splashColor: color, onTap: onTap))),
          ],
        ),
      ),
    );
  }

  Widget _backgroundImageWidget() {
    return Positioned.fill(
      child: isNetworkImg ? CachedNetworkImage(imageUrl: image!, fit: BoxFit.cover, errorWidget: (context, url, error) => Image.asset(kFailedNetworkImage)) : Image.asset(image!, fit: BoxFit.cover),
    );
  }

  Widget _titleWidget() {
    return Positioned.fill(
      child: Align(
        alignment: textAlignment,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: textBackgroundColor, borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          child: FittedBox(child: Text(title!, style: TextStyle(color: textColor, fontSize: 20, fontFamily: kFontFamily))),
        ),
      ),
    );
  }
}
