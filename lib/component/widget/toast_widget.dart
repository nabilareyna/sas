import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum ToastWidgetType { SUCCESS, WARNING, ERROR }

class ToastWidget extends StatefulWidget {
  const ToastWidget({Key? key}) : super(key: key);

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
