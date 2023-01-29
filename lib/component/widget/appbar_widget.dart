import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, this.title, this.centerTitle = true, this.leading}) : super(key: key);

  final Widget? title;
  final bool centerTitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0, 0.1), blurRadius: 4, spreadRadius: 0)]),
      child: AppBar(
        backgroundColor: Colors.white,
        title: title,
        centerTitle: centerTitle,
        leading: leading,
      ),
    );
  }
}
