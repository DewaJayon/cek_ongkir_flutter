import 'package:cek_ongkir_jayon/pages/cek_resi.dart';
import 'package:cek_ongkir_jayon/pages/check_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Jayon Cek Ongkir & Resi',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CheckPage();
              }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 85, 85, 85),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 85, 85, 85),
                          blurRadius: 50),
                    ],
                  ),
                  child: const Text("Cek Ongkir",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CekResi();
                    }));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 85, 85, 85),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 85, 85, 85),
                                blurRadius: 50),
                          ],
                        ),
                        child: const Text("Cek Resi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
