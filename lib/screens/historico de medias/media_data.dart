class MediaData {
//Fields
  String data;
  String media;
//Constructor
  MediaData.fromJson(Map<String, dynamic> value) {
    data = value['data'];
    media = value['media'];
  }
//Methds

}
