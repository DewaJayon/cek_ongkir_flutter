import 'package:flutter/material.dart';
import 'package:cek_ongkir_jayon/pages/check_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(children: [
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            alignment: Alignment.topLeft,
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cek Ongkir",
                    style: TextStyle(
                        fontFamily: "BebasNeue",
                        fontSize: 50,
                        color: Color.fromARGB(255, 0, 132, 255)),
                  ),
                  Text(
                    "Cari ongkos kirimmu disini",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 91, 91, 91)),
                  ),
                ]),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Image(
            image: const AssetImage("assets/Onboarding.gif"),
            width: MediaQuery.of(context).size.width * 0.95,
          ),
        ]),
        Align(
          alignment: Alignment.bottomCenter,
          child: ListView(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 102, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.01,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(179, 213, 213, 213),
                      borderRadius: BorderRadius.circular(20)),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Text("Support jasa ekspedisi :",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 236, 236, 236),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.3,
                  //color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Image(
                            image: AssetImage("assets/Jne.png"),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: const Image(
                            image: AssetImage("assets/Pos.png"),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: const Image(
                            image: AssetImage("assets/Tiki.png"),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.13,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent, // foreground
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const CheckPage();
                        }));
                      },
                      child: const Text(
                        "Cek Ongkir Disini",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ))
              ]),
            ),
          ]),
        )
      ]),
    );
  }
}
