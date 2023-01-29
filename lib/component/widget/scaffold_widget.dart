import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sas/component/widget/appbar_widget.dart';
import 'package:sas/module/dashboard/controller/c_page_view.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

enum Platform { WEB, MOBILE, TAB }

class WScaffold extends StatelessWidget {
  final pageC = Get.find<CPgeView>();

  final PreferredSizeWidget? appBar;
  final String? title;
  final Widget Function(BuildContext context, Orientation orientation, Platform platform)? body;
  final Widget? leading;
  final bool resizeToAvoidBottomInset;

  WScaffold({Key? key, this.appBar, this.title, this.body, this.leading, this.resizeToAvoidBottomInset = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
        Platform platform = Platform.MOBILE;
        if (Get.width <= Const.MAX_MOBILE_SCREEN) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          platform = Platform.MOBILE;
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar != null
              ? appBar!
              : title != null
                  ? PreferredSize(
                      child: AppBarWidget(
                        title: Text(title!, style: Styles.appBarTitle, overflow: TextOverflow.ellipsis),
                        leading: leading,
                      ),
                      preferredSize: const Size.fromHeight(kToolbarHeight))
                  : null,
          body: body!(context, orientation, platform),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: ('Home')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    size: 30,
                  ),
                  label: ('History')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 30,
                  ),
                  label: ('Profile')),
            ],
            currentIndex: pageC.pageIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int i) => pageC.changePage(i),
          ),
        );
      })),
    );
  }
}
