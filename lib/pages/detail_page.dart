import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String? kota_asal;
  // ignore: non_constant_identifier_names
  final String? kota_tujuan;
  final String? berat;
  final String? kurir;

  // ignore: non_constant_identifier_names
  const DetailPage(
      // ignore: non_constant_identifier_names
      {super.key,
      // ignore: non_constant_identifier_names
      this.kota_asal,
      // ignore: non_constant_identifier_names
      this.kota_tujuan,
      this.berat,
      this.kurir});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List _data = [];
  var key = '89d52eb76ad5b3a125d688bd16b66f91';

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
        title: const Text("Detail Cek Ongkir"),
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
