import 'dart:convert';

import 'package:berita_indonesia/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListNews extends StatelessWidget {
  List daftarNews = [];
  String keyApi = "4463bbf6274c4280b2631a3ebc049c75";
  Future _getAllNews() async {
    try {
      var respone = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$keyApi"));
      var data = json.decode(respone.body);
      daftarNews = data['articles'];
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita Indonesia"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Icon(
              Icons.leak_add_rounded,
              size: 50,
            ));
          }
          return ListView.builder(
            itemCount: daftarNews.length,
            itemBuilder: (context, index) => ListTile(
              leading: Container(
                height: 100,
                width: 100,
                child: daftarNews[index]['urlToImage'] != null
                    ? Image.network(
                        "${daftarNews[index]['urlToImage']}",
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text("kosong"),
                      ),
              ),
              title: Text("${daftarNews[index]['title']}"),
              subtitle: Text("${daftarNews[index]['description']}"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(
                            daftarNews[index]['urlToImage'].toString(),
                            daftarNews[index]['author'].toString(),
                            daftarNews[index]['description'].toString(),
                            daftarNews[index]['content'].toString())));
              },
            ),
          );
        },
      ),
    );
  }
}
