import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WDatePickerFormIzin extends StatefulWidget {
  const WDatePickerFormIzin({Key? key}) : super(key: key);

  @override
  _WDatePickerFormIzinState createState() => _WDatePickerFormIzinState();
}

class _WDatePickerFormIzinState extends State<WDatePickerFormIzin> {
  
  String _dateTime = DateFormat("EEEE, d MMMM yyyy").format(DateTime.now());
  
  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(5000)
        ).then((value) {
          setState(() {
            _dateTime = value! as String;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              MaterialButton(
                onPressed: _showDatePicker,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7EFF1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(_dateTime.toString()),
                        const ImageIcon(
                          AssetImage('assets/icons/datepicker.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
