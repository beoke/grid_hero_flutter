import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "GRID DAN HERO",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperHero = [];

  var karakter = [
    {"nama": "Aquaman", "gambar": "aquaman.png"},
    {"nama": "Captain America", "gambar": "capt.png"},
    {"nama": "Catwoman", "gambar": "catwoman.png"},
    {"nama": "Flash", "gambar": "flash.png"},
    {"nama": "Hulk", "gambar": "hulkk.png"},
    {"nama": "Ironman", "gambar": "ironman.png"},
    {"nama": "Spiderman", "gambar": "spiderman.png"},
    {"nama": "Superman", "gambar": "superman.png"},
    {"nama": "Thor", "gambar": "thor.png"},
    {"nama": "Venom", "gambar": "venom.png"},
  ];

  void _buatlist() {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"]!;

      daftarSuperHero.add(
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget> [
              Image.asset("img/$gambar", fit: BoxFit.cover,),
              Text(karakternya['nama']!,style: TextStyle(fontSize: 18.0),)
              
            ],
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _buatlist(); // Call the function to initialize daftarSuperHero
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Superhero",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarSuperHero,
      ),
    );
  }
}
