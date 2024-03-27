import 'package:cek_ongkir_jayon/pages/cek_resi.dart';
import 'package:cek_ongkir_jayon/pages/check_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yuuta Cek Ekspedisi'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Action when shopping cart button is pressed
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'assets/ayaka.jpg',
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Menu dari Aplikasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildMenuItem(context, 'Cek Ongkir', Icons.local_shipping),
                    _buildMenuItem(context, 'Cek Resi', Icons.find_in_page),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return InkWell(
      // When the user taps the button, show a snackbar.
      onTap: () {
        if (title == 'Cek Ongkir') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const CheckPage();
          }));
        }
        if (title == 'Cek Resi') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const CekResi();
          }));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200],
                child: Icon(icon, size: 30),
              ),
              const SizedBox(height: 5),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
