import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIKebijakanPrivasi extends StatelessWidget {
  const UIKebijakanPrivasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kebijakan Privasi', style: Styles.appBarTitle),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Styles.secondaryColor,
          ),
          onPressed: () => Get.toNamed(Routes.profile),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                        'Kebijakan Privasi SAS',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w600, letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kebijakan Privasi',
                        style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2),
                      ),
                      Gap(16),
                      Text(
                          'MOHON ANDA MEMBACA KEBIJAKAN PRIVASI INI DENGAN SEKSAMA UNTUK MEMASTIKAN BAHWA ANDA MEMAHAMI BAGAIMANA SAS MENGUMPULKAN, MENYIMPAN, MENGGUNAKAN, MEMINDAHKAN, MENGUNGKAPKAN DAN MELINDUNGI INFORMASI PRIBADI YANG DIPEROLEH MELALUI APLIKASI KAMI.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                        'Penggunaan Anda atas Aplikasi dan Layanan kami tunduk pada Ketentuan Penggunaan dan Kebijakan Privasi ini dan mengindikasikan persetujuan Anda terhadap Ketentuan Penggunaan dan Kebijakan Privasi tersebut.',
                        style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2),
                      ),
                      Gap(16),
                      Text('Definisi', style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text(
                          '"Aplikasi" berarti aplikasi SAS yang tersedia di google play store, app store maupun store yang tersedia dalam sistem perangkat Anda.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                          '"Informasi Pribadi" berarti data perseorangan yang melekat dan dapat diidentifikasi pada suatu individu dan yang dikumpulkan melalui Aplikasi, seperti nama, alamat, nomor identitas, nomor telepon, alamat (e-mail), perizinan dan/atau sejenisnya, dan informasi lain yang mungkin dapat mengidentifikasi Anda sebagai pengguna Aplikasi.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text('"SAS" berarti Sistem Aplikasi Sekolah, yang didirikan berdasarkan hukum Negara Republik Indonesia.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                          '"Ketentuan Penggunaan" berarti syarat dan ketentuan atau prosedur standar operasi atau ketentuan lainnya sehubungan dengan masing-masing Aplikasi yang dikembangkan oleh SAS, sebagaimana dapat diubah atau ditambah dari waktu ke waktu;',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                          '"Layanan" berarti hal-hal yang ditawarkan oleh SAS melalui Aplikasi kepada Anda, termasuk namun tidak terbatas pada pemrosesan dan pengantaran untuk produk yang disediakan dari waktu ke waktu melalui Aplikasi.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text('Tujuan Informasi Pribadi yang SAS Kumpulkan',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text(
                        'SAS mengumpulkan Informasi Pribadi tertentu dari Anda agar Aplikasi dapat menjalankan fungsinya termasuk namun tidak terbatas dengan tujuan untuk menghubungi Anda tentang akun Anda dalam Aplikasi dan Layanan SAS, memberikan Layanan kepada Anda, dan untuk mendeteksi, mencegah, mengurangi dan menyelidiki aktivitas curang atau ilegal.',
                        style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2),
                      ),
                      Gap(16),
                      Text('Pemberian Informasi Pribadi oleh Anda',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                          'Informasi Pribadi dapat Anda berikan secara langsung (sebagai contoh, saat Anda mendaftar sebagai pengguna Aplikasi) maupun terkumpul ketika Anda menggunakan Aplikasi.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text('Penggunaan Informasi Pribadi Yang SAS Kumpulkan',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text(
                          'SAS menggunakan Informasi Pribadi untuk tujuan verifikasi kepemilikan Anda atas suatu akun dalam Aplikasi kami, untuk berkomunikasi dengan Anda sehubungan dengan pemrosesan, penggunaan atau pengelolaan Layanan dan Aplikasi dan untuk memberikan Anda informasi mengenai Aplikasi dan Layanan. Kami juga dapat menggunakan Informasi Pribadi untuk mengirimkan pesan, pembaharuan yang bersifat umum atas Aplikasi dan Layanan, penawaran-penawaran khusus atau promosi-promosi.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                          'SAS menggunakan Informasi Pribadi secara keseluruhan untuk menganalisa pola penggunaan Anda atas Aplikasi. Anda dengan ini setuju bahwa Informasi Pribadi Anda akan digunakan oleh sistem pemrosesan data internal SAS untuk memastikan diberikannya Layanan yang terbaik dalam Aplikasi untuk Anda.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text('Pemberian Informasi yang SAS Kumpulkan',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text(
                          'Anda setuju bahwa SAS dapat memberikan Informasi Pribadi Anda kepada pihak-pihak ketiga baik Sekolah maupun perorangan dimana SAS  bekerjasama untuk memfasilitasi atau memberikan bantuan operasional.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                        'SAS tidak membagikan Informasi Pribadi Anda kepada pihak manapun yang berkepentingan selain serta pihak ketiga dengan tujuan penggunaan yang spesifik yang disebutkan di paragraf pertama bagian ini, tanpa persetujuan dari Anda. Namun demikian, Kami akan mengungkapkan Informasi Pribadi Anda sepanjang diwajibkan secara hukum, atau diperlukan untuk tunduk pada ketentuan peraturan perundang-undangan, institusi pemerintah, atau dalam hal terjadi sengketa, atau segala bentuk proses hukum antara Anda dan SAS, atau antara Anda dan pihak lain sehubungan dengan, atau terkait dengan Aplikasi dan Layanan, atau dalam keadaan darurat yang berkaitan dengan keamanan Anda.',
                        style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2),
                      ),
                      Gap(16),
                      Text('Perlindungan Data dan Informasi Pribadi',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                          'Perlindungan data dan Informasi Pribadi Anda adalah suatu kewajiban bagi SAS. SAS akan memberlakukan langkah-langkah untuk melindungi dan mengamankan data dan Informasi Pribadi Anda. Namun demikian, SAS tidak dapat sepenuhnya menjamin bahwa sistem SAS tidak akan diakses soleh virus, malware, gangguan atau kejadian luar biasa termasuk akses oleh pihak ketiga yang tidak berwenang. Anda harus menjaga keamanan dan kerahasiaan data yang berkaitan dengan akun Anda pada Aplikasi termasuk kata sandi dan data-data lainnya yang Anda berikan di dalam Aplikasi ini.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(16),
                      Text('Perubahan atas Kebijakan Privasi ini',
                          style: TextStyle(fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2)),
                      Gap(8),
                      Text(
                          'SAS dapat mengubah Kebijakan Privasi ini untuk sejalan dengan perkembangan kegiatan bisnis SAS atau dipersyaratkan oleh peraturan perundang-undangan dan instusi pemerintah terkait. Jika SAS mengubah Kebijakan Privasi ini, SAS akan memberitahu Anda melalui surat elektronik (e-mail) atau memberikan notifikasi pada Aplikasi 1 (satu) hari sebelum perubahan berlaku. SAS meminta Anda untuk meninjau Aplikasi secara reguler dan terus-menerus selama Anda menggunakan Aplikasi untuk mengetahui informasi terbaru tentang bagaimana ketentuan Kebijakan Privasi ini SAS diberlakukan.',
                          style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w500, letterSpacing: 2))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
