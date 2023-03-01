import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIPanduanSAS extends StatelessWidget {
  const UIPanduanSAS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Panduan SAS', style: Styles.appBarTitle),
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
                Container(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFF61A2BE),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Panduan Aplikasi SAS',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Sistem Absensi Sekolah',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ExpansionTile(
                      title: const Text(
                        'Absen',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Panduan Absen',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w600, letterSpacing: 2),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: const [Expanded(child: Text('• Kunjungi halaman dashboard kemudian tekan tombol Absen'))],
                                  ),
                                ),
                                Row(
                                  children: const [Expanded(child: Text('• Pastikan anda berada di jangkauan wilayah SMKN 4 Malang'))],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: const [
                                      Expanded(
                                          child: Text(
                                              '• Kemudian tekan tombol kirim dan akan muncul notifikasi bahwa absensi berhasil !'))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ExpansionTile(
                      title: const Text(
                        'Izin',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Panduan Izin',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w600, letterSpacing: 2),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: const [Expanded(child: Text('• Kunjungi halaman dashboard kemudian tekan tombol Izin'))],
                                  ),
                                ),
                                Row(
                                  children: const [Expanded(child: Text('• Pilih jenis izin yang tersedia pada halaman pengajuan izin'))],
                                ),
                                Row(
                                  children: const [Expanded(child: Text('• Pilih tanggal mulai dan tanggal selesai izin pada formulir'))],
                                ),
                                Row(
                                  children: const [Expanded(child: Text('• Upload surat izin'))],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: const [
                                      Expanded(
                                          child: Text(
                                              '• Kemudian tekan tombol kirim'))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
