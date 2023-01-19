import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, this.title, this.centerTitle = true}) : super(key: key);

  final Widget? title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        title: title,
        centerTitle: centerTitle,
      ),
    );
  }
}
