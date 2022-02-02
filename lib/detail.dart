import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail(this.foto, this.penulis, this.deskripsi, this.konten);
  String foto;
  String penulis;
  String deskripsi;
  String konten;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Image.network(
              foto,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: penulis != null ? Text("$penulis") : Text('Tidak ada'),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: deskripsi != null ? Text("$deskripsi") : Text('Tidak ada'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: konten != null ? Text("$konten") : Text('Tidak ada'),
          )
        ],
      )),
    );
  }
}
