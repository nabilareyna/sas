import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/feedback/controller/c_feedback.dart';
import 'package:sas/module/feedback/widget/w_button_feedback.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIFeedback extends GetView<CFeedback> {
  const UIFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feedback', style: Styles.appBarTitle),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Styles.secondaryColor,
          ),
          onPressed: () => Get.toNamed(Routes.profile),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 90.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color(0xFF61A2BE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Feedback',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.nisControllerFeedBack,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Nama',
                            hintText: 'Masukkan nama anda'),
                      ),
                      TextField(
                        controller: controller.emailControllerFeedback,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Masukkan email anda'),
                      ),
                      TextField(
                        controller: controller.feedbackController,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Your Feedback',
                            hintText: 'Masukkan feedback anda'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    child: const WButtonFeedback(),
                    onTap: () {
                      // Get.toNamed(Routes.getProfileRoute());
                      controller.insertFeedBack(
                          controller.nisControllerFeedBack.text,
                          controller.emailControllerFeedback.text,
                          controller.feedbackController.text);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
