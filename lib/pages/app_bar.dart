import 'package:cek_ongkir_jayon/pages/check_page.dart';
import 'package:cek_ongkir_jayon/pages/home_page.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 0, 102, 255),
        title: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Text("Cek Ongkir",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline_rounded),
                      color: const Color.fromARGB(255, 255, 181, 7),
                    ),
                    const Text(" Tentang")
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                  ),
                  const Text(
                    "Batal",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )
                ]),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CheckPage();
              }));
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
