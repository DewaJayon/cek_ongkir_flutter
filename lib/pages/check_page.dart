import 'dart:convert';
import 'package:cek_ongkir_jayon/pages/cek_resi.dart';
import 'package:cek_ongkir_jayon/pages/detail_page.dart';
import 'package:cek_ongkir_jayon/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cek_ongkir_jayon/models/kota.dart';
import 'package:http/http.dart' as http;

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  var key =
      'Api key anda'; //masukkan api key yang diberikan oleh rajaongkir.com
  var kota_asal;
  var kota_tujuan;
  var berat;
  var kurir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuuta Cek Ekspedisi'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Cek Ongkir'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Cek Resi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CekResi()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownSearch<Kota>(
              popupProps: const PopupPropsMultiSelection.menu(
                showSearchBox: true,
              ),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Pilih Kota",
                  hintText: "Pilih Kota Asal",
                ),
              ),
              onChanged: (value) {
                kota_asal = value?.cityId;
              },
              //kata yang ditampilkan setelah kita memilih
              itemAsString: (item) => "${item.type} ${item.cityName}",
              asyncItems: (String filter) async {
                var response = await http.get(Uri.parse(
                    // ignore: unnecessary_brace_in_string_interps
                    "https://api.rajaongkir.com/starter/city?key=${key}"));
                List allKota = (jsonDecode(response.body)
                    as Map<String, dynamic>)['rajaongkir']['results'];
                //simpan data ke dalam model kota
                var dataKota = Kota.fromJsonList(allKota);
                return dataKota;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownSearch<Kota>(
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Pilih Kota Tujuan",
                  hintText: "Pilih Kota Tujuan",
                ),
              ),
              popupProps: const PopupPropsMultiSelection.menu(
                showSearchBox: true,
              ),
              onChanged: (value) {
                kota_tujuan = value?.cityId;
              },
              //kata yang akan ditampilkan setelah dipilih
              itemAsString: (item) => "${item.type} ${item.cityName}",
              asyncItems: (String filter) async {
                var response = await http.get(Uri.parse(
                    // ignore: unnecessary_brace_in_string_interps
                    "https://api.rajaongkir.com/starter/city?key=${key}"));
                List allKota = (jsonDecode(response.body)
                    as Map<String, dynamic>)['rajaongkir']['results'];
                //simpan data ke dalam model kota
                var dataKota = Kota.fromJsonList(allKota);
                return dataKota;
              },
            ),
            const SizedBox(height: 20),
            TextField(
              //input hanya angka
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Berat Paket (gram)",
                hintText: "Input Berat Paket",
              ),
              onChanged: (text) {
                berat = text;
              },
            ),
            const SizedBox(height: 20),
            DropdownSearch<String>(
                items: const ["jne", "tiki", "pos"],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Pilih Kurir",
                    hintText: "Pilih Kurir",
                  ),
                ),
                onChanged: (text) {
                  kurir = text;
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (kota_asal == null ||
                    kota_tujuan == null ||
                    berat == null ||
                    kurir == null) {
                  const snackBar =
                      SnackBar(content: Text("Isi bidang yang masih kosong!"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  Navigator.push(
                    context,
                    // DetailPage adalah halaman yang dituju
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              kota_asal: kota_asal,
                              kota_tujuan: kota_tujuan,
                              berat: berat,
                              kurir: kurir,
                            )),
                  );
                }
              },
              child: const Center(
                child: Text("Cek Ongkir"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
