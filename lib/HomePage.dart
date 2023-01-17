import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String _nama;
  HomePage(this._nama);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String nama = '';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   nama = widget._nama;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget._nama}'),
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          // child: FlatButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Text(
          //     'Welcome',
          //     style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          // ),
        ),
      ),
    );
  }
}
