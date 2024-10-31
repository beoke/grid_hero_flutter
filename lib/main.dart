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
  final List<Map<String, String>> karakter = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Superhero",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: karakter.length,
        itemBuilder: (context, index) {
          final karakternya = karakter[index];
          return _buildHeroCard(karakternya);
        },
      ),
    );
  }

  Widget _buildHeroCard(Map<String, String> karakternya) {
    final String gambar = karakternya["gambar"]!;
    return Card(
      child: Column(
        children: <Widget>[
          Hero(
            tag: karakternya['nama']!,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Detail(
                      nama: karakternya['nama']!,
                      gambar: gambar,
                    ),
                  ));
                },
                child: Image.asset(
                  "img/$gambar",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            karakternya['nama']!,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key, required this.nama, required this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Hero(
            tag: nama,
            child: Image.asset(
              "img/$gambar",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
