import 'dart:convert';

import 'package:cek_ongkir_jayon/pages/cek_resi.dart';
import 'package:cek_ongkir_jayon/pages/check_page.dart';
import 'package:cek_ongkir_jayon/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final String? kota_asal;
  final String? kota_tujuan;
  final String? berat;
  final String? kurir;

  const DetailPage(
      {super.key, this.kota_asal, this.kota_tujuan, this.berat, this.kurir});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List _data = [];
  var key =
      'Api key anda'; //masukkan api key yang diberikan oleh rajaongkir.com

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      // ignore: unused_local_variable
      final response = await http.post(
        Uri.parse(
          "https://api.rajaongkir.com/starter/cost",
        ),
        //MENGIRIM PARAMETER
        body: {
          "key": key,
          "origin": widget.kota_asal,
          "destination": widget.kota_tujuan,
          "weight": widget.berat,
          "courier": widget.kurir
        },
      ).then((value) {
        var data = jsonDecode(value.body);

        setState(() {
          _data = data['rajaongkir']['results'][0]['costs'];
        });
      });
    } catch (e) {
      //ERROR
      // ignore: avoid_print
      print(e);
    }
  }

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
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text("${_data[index]['service']}"),
            subtitle: Text("${_data[index]['description']}"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Rp ${_data[index]['cost'][0]['value']}",
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text("${_data[index]['cost'][0]['etd']} Days")
              ],
            ),
          );
        },
      ),
    );
  }
}
