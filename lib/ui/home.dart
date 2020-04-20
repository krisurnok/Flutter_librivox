import '../Model/AudioBookRes.dart';
import '../Services/audioBookService.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LibrivoxApp extends StatefulWidget {
  LibrivoxApp({Key key}) : super(key: key);

  @override
  _LibrivoxState createState() => _LibrivoxState();
}

class _LibrivoxState extends State<LibrivoxApp> {
  Future<AudioBooksRes> futureAudioBook;
  @override
  void initState() {
    super.initState();
    futureAudioBook = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: _buildList(futureAudioBook),
      backgroundColor: Colors.grey[350],
    );
  }
}

Widget _buildList(Future<AudioBooksRes> futureAudioBook) {
  return (FutureBuilder<AudioBooksRes>(
      future: futureAudioBook,
      builder: (context, AsyncSnapshot<AudioBooksRes> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('Input a URL to start');
          case ConnectionState.waiting:
            return new Center(child: new CircularProgressIndicator());
          case ConnectionState.active:
            return new Text('');
          case ConnectionState.done:
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(5.0),
                childAspectRatio:0.8,
                children: List.generate(snapshot.data.books.length, (index) {
                  return (_Card(snapshot.data.books[index]));
                }),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
        }
        // By default, show a loading spinner.
      }));
}

Widget _Card(Book book) {
  return Container(
    
    child: Column(
      children: <Widget>[
        Container(
          child: getImage(book),
          padding: EdgeInsets.only(top: 10),
        ),
        //,
        Expanded(
            flex: 2,
            child: Center(
              child: Text(
                '${book.id} ${book.title}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "OpenSans",
                    fontSize: 15.0),
              ),
            )),
      ],
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    height: 300.0,
    margin: EdgeInsets.all(5.0),
  );
}

Widget getImage(Book book) {
  return FutureBuilder(
    future: GetImage(book.urlLibrivox),
    builder: (BuildContext context, AsyncSnapshot<String> imageurl) {
      if (imageurl.connectionState == ConnectionState.done) {
        try {
          return Image.network(imageurl.data.toString(), height: 150);
        } catch (e) {
          return Image.network(
              imageurl.data.toString() +
                  ("?&time=" +
                      DateTime.now().millisecondsSinceEpoch.toString()),
              height: 150);
        }
        ;
      } else {
        return new Center(child: new CircularProgressIndicator());
      }
    },
  );
}
