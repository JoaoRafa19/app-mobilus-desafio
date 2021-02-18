import 'dart:convert';

import 'package:covid_status/screens/historico%20de%20medias/media_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HistoricoMedias extends StatefulWidget {
  @override
  _HistoricoMediasState createState() => _HistoricoMediasState();
}

class _HistoricoMediasState extends State<HistoricoMedias> {
  bool onload = false;
  List<MediaData> lista = [];
  bool message = true;

  Future<void> jsonRestApi() async {
    setState(() {
      message = false;
      onload = true;
    });
    String url =
        'https://covid19status-7d37e-default-rtdb.firebaseio.com/medias.json';
    Response resp = await get(url);

    Map data = jsonDecode(resp.body);
    List<MediaData> lista_ = List<MediaData>();

    for (var key in data.keys) {
      lista_.add(MediaData.fromJson(data[key]));
    }

    setState(() {
      lista.addAll(lista_);
      onload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: jsonRestApi,
        child: Icon(Icons.refresh_rounded),
      ),
      body: Container(
        child: message
            ? Center(child: Text("Os dados aparecerão aqui!"))
            : onload
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.grey),
                    ),
                  )
                : ListView.builder(
                    clipBehavior: Clip.hardEdge,
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black54, width: 1)),
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          leading: Icon(Icons.storage),
                          title: Text("Data: ${lista[index].data}"),
                          subtitle:
                              Text("Media registrada: ${lista[index].media}"),
                        ),
                      );
                    }),
      ),
    );
  }
}
