import 'dart:convert';
import 'package:covid_status/screens/historicodados/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HistoricoDados extends StatefulWidget {
  @override
  _HistoricoDadosState createState() => _HistoricoDadosState();
}

class _HistoricoDadosState extends State<HistoricoDados> {
  Uri url = Uri.parse('https://covid-api-mobilus.herokuapp.com/covid/timeline');
  bool onload = false;
  List<Data> lista = [];
  bool message = true;
  String mensagem = 'Os Dados Aparecerão aqui!';

  Future<void> jsonRestApi() async {
    setState(() {
      onload = true;
      message = false;
    });
    this.lista.clear();
    Response response = await get(this.url);
    List data = jsonDecode(response.body);

    List<Data> lista = List<Data>();

    for (Map<String, dynamic> item in data) {
      lista.add(Data.fromJson(item));
    }

    if (mounted)
      setState(() {
        this.lista.addAll(lista);
        onload = false;
      });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => jsonRestApi());
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
            ? Center(child: Text("${this.mensagem}"))
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
                            leading: Icon(Icons.data_usage),
                            subtitle: Text(
                                '\ncasos: ${lista[index].cases} \nmortes: ${lista[index].deaths} \nrecuperados:${lista[index].recovered}\n'),
                            title: Text(
                                "Data: ${lista[index].lastupdate.split('T')[0].split('-').reversed.join('/')}")),
                      );
                    }),
      ),
    );
  }
}
