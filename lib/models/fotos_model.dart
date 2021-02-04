class Foto {
  int albumId, id;
  String title, url, thumbnailUrl;

  Foto.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}
