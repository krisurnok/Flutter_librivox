import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import '../Model/AudioBookRes.dart';
import 'package:http/http.dart' as http;

Future<AudioBooksRes> fetchAlbum() async {
  final response =
      await http.get('https://librivox.org/api/feed/audiobooks/?format=json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AudioBooksRes.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<String> GetImage(String urlLibrivox) async {
  try {
    return await _getImage(urlLibrivox);
  } catch (e) {
    return await _getImage(urlLibrivox);
  }
}

Future<String> _getImage(String urlLibrivox) async {
  String url = urlLibrivox +
      ("?&time=" + DateTime.now().millisecondsSinceEpoch.toString());
  log(url);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Document d = parse(response.body);

    return d
        .getElementsByClassName('book-page-book-cover')[0]
        .children[0]
        .attributes["src"];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    return 'https://lh3.googleusercontent.com/proxy/k8_dOEBtbDJGSrk6LRkY8s0D9Vw6i8VzLcVvzaKbqQA9Gi09B47kEVmNfSIaxbilgBlU6syVCSYZ4r7Gy_GEpP9qRMkYqe-7KcA5aB7THe5o4jdwxu5PWDk';
  }
}
