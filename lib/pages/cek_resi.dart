import 'package:cek_ongkir_jayon/pages/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cek_ongkir_jayon/models/resi.dart';

class CekResi extends StatefulWidget {
  const CekResi({Key? key}) : super(key: key);

  @override
  State<CekResi> createState() => _CekResiState();
}

class _CekResiState extends State<CekResi> {
  List<String> options = [
    'jne',
    'pos',
    'tiki',
    'sicepat',
    'jnt',
    'jnt_cargo',
    'anteraja',
    'wahana',
    'ninja',
    'lion',
    'pcp',
    'jet',
    'rex',
    'first',
    'ide',
    'spx',
    'kgx',
    'sap',
    'jxe',
    'rpx',
    'lex',
    'indah_cargo',
    'dakota',
    'kurir_tokopedia'
  ];
  TextEditingController resiController = TextEditingController();
  TextEditingController kurirController = TextEditingController();
  dynamic data = [];
  bool _isLoading = false;
  Resi resi =
      Resi(); //inisialisasi class Api, karena kita akan menggunakan methodnya

  //method untuk mengambil data
  Future<void> cekResi() async {
    setState(() {
      _isLoading = true;
    });

    final result = await resi.cekResi(
      kurirController.text,
      resiController.text,
    );

    setState(() {
      data = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Flexible(
                //flexible adalah widget yang berfungsi untuk memberikan lebar porsi pada sebuah widget
                //kita membuat lebar textformfield sebesar 4, sehingga lebarnya lebih lebar dari
                //dropdownbuttonfield
                flex: 3,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Resi',
                    labelText: 'Resi',
                  ),
                  controller: resiController,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                //flexible adalah widget yang berfungsi untuk memberikan porsi lebar pada sebuah widget
                //kita membuat lebar dropdownbuttonfield sebesar 2, sehingga lebarnya lebih kecil dari
                //textformfield
                flex: 2,
                child: DropdownButtonFormField<String>(
                  items: options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      kurirController.text = newValue!;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Kurir', labelText: 'Kurir'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoading = true; // Aktifkan indikator progress
              });
              cekResi();
            },
            child: _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ), // Ganti warna di sini
                  ) // Tampilkan indikator saat isLoading true
                : const Text('Cari Resi'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Hasil Pengecekan',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          //jika data tidak kosong dan status 200
          data.isNotEmpty && data['status'] == 200
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengirim: ${data['data']['detail']['shipper']}', //tampilkan resi
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Penerima: ${data['data']['detail']['receiver']}', //tampilkan resi
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Resi: ${data['data']['summary']['awb']}', //tampilkan resi
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Kurir: ${data['data']['summary']['courier']}', //tampilkan kurir
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Resi: ${data['data']['summary']['status']}', //tampilkan status pengiriman
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),

                    //kita akan menampilkan history
                    ListView.builder(
                      shrinkWrap:
                          true, //wajib menggunakan ini saat parentnya adalah listview
                      physics:
                          const NeverScrollableScrollPhysics(), //wajib menggunakan ini sat parentnya adalah listview
                      itemCount:
                          data['data']['history'].length, //panjang data history
                      itemBuilder: (context, index) {
                        final item = data['data']['history'][index];
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text('${item['date']}'), //tanggal history
                              subtitle:
                                  Text('${item['desc']}'), //deskripsi history
                            ),
                            const Divider()
                          ],
                        );
                      },
                    ),
                  ],
                )
              //pokoknya jika data kosong atau tidak 200 maka tampilkan teks ini
              : const Text('Belum Ada Data ditemukan')
        ],
      ),
    );
  }
}
