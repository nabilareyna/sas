import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WDatePickerSelesai extends StatefulWidget {
  const WDatePickerSelesai({Key? key}) : super(key: key);

  @override
  _WDatePickerSelesaiState createState() => _WDatePickerSelesaiState();
}

class _WDatePickerSelesaiState extends State<WDatePickerSelesai> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
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
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: _date,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Pilih Tanggal Selesai*',
                                hintStyle: TextStyle(
                                  color: Color(0xFFA3A3A3),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime(4000));
                                if (pickedDate != null) {
                                  setState(() {
                                    _date.text = DateFormat('EEEE, d MMMM yyyy')
                                        .format(pickedDate);
                                  });
                                } else {
                                  print("Dimohon untuk memilih");
                                }
                              },
                            ),
                          ),
                        ),
                        const ImageIcon(
                          AssetImage('assets/icons/datepicker.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
