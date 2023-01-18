// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xFF61A2BE),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.account_circle_outlined),
//             // icon: Image.asset("../assets/icons/maleuser.png"),
//             color: Colors.black,
//             iconSize: 30,
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//               height: 225.0,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color(0xFF61A2BE),
//               ),
//               child: Image.asset(
//                 '../assets/images/logosastul.png',
//                 alignment: Alignment.topCenter,
//               )),
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 40.0),
//             child: SizedBox(
//                 height: 225.0,
//                 width: double.infinity,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(12.0),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         offset: Offset(0.0, 4.0),
//                         blurRadius: 4,
//                         spreadRadius: 0,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         textAlign: TextAlign.center,
//                         DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
//                         style: const TextStyle(
//                           fontSize: 15,
//                           height: 4.5,
//                         ),
//                       ),
//                       Text(
//                         textAlign: TextAlign.center,
//                         DateFormat.Hm().format(DateTime.now()),
//                         style: const TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                           height: 0.0,
//                         ),
//                       ),
//                       const Divider(
//                         color: Colors.grey,
//                         thickness: 1,
//                         indent: 20,
//                         endIndent: 20,
//                       )
//                     ],
//                   ),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 34, left: 34, top: 280),
//             child: SizedBox(
//               height: 80,
//               width: double.infinity,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF61A2BE),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12.0),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       offset: Offset(0.0, 4.0),
//                       blurRadius: 4,
//                       spreadRadius: 0,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: const [
//                     Text(
//                       textAlign: TextAlign.center,
//                       'Waktu Presensi',
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         height: 2.3,
//                       ),
//                     ),
//                     Text(
//                       textAlign: TextAlign.center,
//                       'Jam masuk 05.30 - 07.00 WIB',
//                       style: TextStyle(
//                         fontSize: 15,
//                         height: 0.0,
//                       ),
//                     ),
//                     Text(
//                       textAlign: TextAlign.center,
//                       'Jam pulang 15.15 - 17.00 WIB',
//                       style: TextStyle(
//                         fontSize: 15,
//                         height: 0.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 right: 15, left: 15, top: 370, bottom: 15),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const <Widget>[
//                 Icon(
//                   Icons.circle,
//                   color: Colors.green,
//                   size: 20,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 5, top: 0),
//                   child:
//                       Text("Anda berada dalam jangkauan lokasi titik absensi"),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home_outlined,
//                 size: 30,
//               ),
//               label: ('Home')),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.history,
//                 size: 30,
//               ),
//               label: ('History')),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.person_outline_rounded,
//                 size: 30,
//               ),
//               label: ('Profile')),
//         ],
//         currentIndex: _selectedNavbar,
//         selectedItemColor: const Color(0xFF61A2BE),
//         unselectedItemColor: Colors.black,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: _changeSelectedNavBar,
//       ),
//     );
//   }}