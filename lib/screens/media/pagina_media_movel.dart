import 'dart:convert';

import 'package:covid_status/common/logo.dart';
import 'package:covid_status/screens/historicodados/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  Uri url = Uri.parse('https://covid19-api.org/api/timeline/BR');

  bool onload = false;
  String text = 'calcular';
  double media = 0.0;
  Future<void> calcular() async {
    setState(() {
      onload = true;
    });
    Response response = await get(this.url);
    var data = jsonDecode(response.body);

    List<Data> lista = List<Data>();

    for (Map<String, dynamic> item in data) {
      lista.add(Data.fromJson(item));
    }
    double aux = 0;
    for (var i = 0; i < 6; i++) {
      aux += (lista[i].deaths - lista[i + 1].deaths);
    }
    aux /= 6;

    //Save media to firebase
    Uri db = Uri.parse('https://covid-api-mobilus.herokuapp.com/savemedia');
    Map<String, String> header = {"Content-type": "application/json"};

    
    String json =
        '{"data": "${DateTime.now().toString().split(' ')[0]}", "media":"${aux.truncateToDouble()}"}';
    Response resp = await post(db, headers: header, body: json);
    

    setState(() {
      onload = false;
      media = aux.truncateToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Logo(),
        SizedBox(height: 16),
        Center(
          child: Text(
            "Media móvel\n\n${this.media}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'BigShoulderDisplay',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 24),
        Container(
          padding: EdgeInsets.all(10),
          child: FlatButton(
            onPressed: calcular,
            child: onload
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.grey))
                : Text("CALCULAR"),
          ),
          decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(25)),
        )
      ],
    );
  }
}
