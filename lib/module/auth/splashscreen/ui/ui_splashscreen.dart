import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sas/component/widget/scaffold_widget.dart';
import 'package:sas/module/auth/core/authentication_manager.dart';
import 'package:sas/module/auth/onBoarding/ui_onboard.dart';

class UISplashScreen extends StatelessWidget {
  final AuthenticationManager authManager = Get.put(AuthenticationManager());

  UISplashScreen({key});

  Future<void> initializeSettings() async {
    authManager.checkLoginStatus();

    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const UIOnBoarding();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  WScaffold waitingView() {
    return WScaffold(body: (context, orientation, platform) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
            Text('Loading...'),
          ],
        ),
      );
    });
  }
}
