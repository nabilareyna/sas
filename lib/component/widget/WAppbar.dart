import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WAppBar extends StatelessWidget {
  const WAppBar({Key? key, this.title, this.isTitleShadow = false, this.centerTitle = true, this.leading, this.titleSpacing}) : super(key: key);

  final Widget? title;
  final bool isTitleShadow;
  final bool centerTitle;
  final Widget? leading;
  final double? titleSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: title,
        centerTitle: centerTitle,
        leading: leading,
      ),
    );
  }
}
