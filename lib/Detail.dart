import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          Hero(
            tag: nama,
            child: Image.asset(
              "img/$gambar",
              fit: BoxFit.contain,
              width: 200.0,
              height: 200.0,
            ),
          ),
          const SizedBox(height: 15.0),
          // Center(
          //   child: Text(
          //     nama,
          //     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          // ),

          new BagianNama(nama: nama),
          new BagianIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({required this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                Text(
                  "$nama\@gmail.com",
                  style: TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 30,
                color: Colors.red,
              ),
              Text("12", style: TextStyle(fontSize: 18.0))
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  const BagianIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Iconteks(
            icon: Icons.call,
            teks: "call",
          ),
          Iconteks(
            icon: Icons.message,
            teks: "message",
          ),
          Iconteks(
            icon: Icons.photo,
            teks: "photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({required this.icon, required this.teks});

  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          Text(
            teks,
            style: TextStyle(fontSize: 10.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining",
            style: TextStyle(fontSize: 15.0,),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
