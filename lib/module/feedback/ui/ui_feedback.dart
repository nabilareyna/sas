import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/feedback/controller/c_feedback.dart';
import 'package:sas/module/feedback/widget/w_button_feedback.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIFeedback extends GetView<CFeedback> {
  final _formKey = GlobalKey<FormState>();
  UIFeedback({Key? key}) : super(key: key);

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
          // key: _fromkey,
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
                            style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w600, letterSpacing: 2),
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
                      TextFormField(
                        controller: controller.nisControllerFeedBack,
                        decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: 'Nama', hintText: 'Masukkan nama anda'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Note Title is Required!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: controller.emailControllerFeedback,
                        decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: 'Email', hintText: 'Masukkan email anda'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Note Title is Required!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: controller.feedbackController,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(border: UnderlineInputBorder(), labelText: 'Your Feedback', hintText: 'Masukkan feedback anda'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Note Title is Required!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const Gap(210),
                InkWell(
                  child: const WButtonFeedback(),
                  onTap: () {
                    // Get.toNamed(Routes.getProfileRoute());
                    if (_formKey.currentState!.validate()) {
//send data to database with this method
                    }

                    controller.insertFeedBack(
                         controller.emailControllerFeedback.text, controller.feedbackController.text);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
