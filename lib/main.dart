import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final biodata = <String, String>{};
  MyApp({super.key}) {
    biodata['name'] = 'Barbatos (Venti)';
    biodata['email'] = 'venti@genshinimpact.com';
    biodata['phone'] = '+621234567890';
    biodata['image'] = 'venti.png';
    biodata['hobby'] = 'Bermain Lira dan Flute';
    biodata['addr'] = 'St. Freeway in side of Moonstad';
    biodata['desc'] =
        '''A bard that seems to have arrived on some unknown wind — sometimes sings songs as old as the hills, and other times sings poems fresh and new.
Likes apples and lively places but is not a fan of cheese or anything sticky.
When using his Anemo power to control the wind, it often appears as feathers, as he's fond of that which appears light and breezy.''';
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Biodata',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Aplikasi Biodata"),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textKotak(Colors.cyan, biodata['name'] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ""}')),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  btnContact(Icons.alternate_email, Colors.red[400],
                      "mailto:${biodata['email']}"),
                  SizedBox(
                    width: 10,
                  ),
                  btnContact(Icons.mark_email_unread, Colors.green[700],
                      "https://wa.me/${biodata['phone']}"),
                  SizedBox(
                    width: 10,
                  ),
                  btnContact(
                      Icons.phone, Colors.blue, "tel:${biodata['phone']}")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              textAttribute("Hobby", biodata['hobby'] ?? ''),
              textAttribute("Alamat", biodata['addr'] ?? ''),
              const SizedBox(
                height: 10,
              ),
              textKotak(Colors.cyan, 'Deskripsi'),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.cyanAccent, width: 4)),
                child: Text(
                  biodata['desc'] ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container textKotak(Color bgColour, String teks) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColour),
      child: Text(
        teks,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }
}

Row textAttribute(String judul, String text) {
  return Row(
    children: [
      SizedBox(
        width: 80,
        child: Text(
          "- $judul",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      const Text(
        ":",
        style: TextStyle(fontSize: 18),
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 18),
      )
    ],
  );
}

Expanded btnContact(IconData icon, var color, String uri) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        launch(uri);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)),
      child: Icon(icon),
    ),
  );
}

void launch(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw Exception('Tidak dapat memanggil: $uri');
  }
}
