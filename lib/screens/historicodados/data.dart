class Data {
  String lastupdate;
  int cases = 0;
  int deaths = 0;
  int recovered = 0;

  Data.fromJson(Map<String, dynamic> jsonData) {
    lastupdate = jsonData['last_update'].toString();
    cases = jsonData['cases'] as int;
    deaths = jsonData['deaths'] as int;
    recovered = jsonData['recovered'] as int;
  }
  
  double media(List<Data> lista) {
  return 0.0;
  }
}


