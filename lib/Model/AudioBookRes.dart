import 'package:flutter/foundation.dart';
import 'package:librivox_app/Services/audioBookService.dart';

class AudioBooksRes extends ChangeNotifier {
  List<Book> books;

  AudioBooksRes({this.books});

  AudioBooksRes.fromJson(Map<String, dynamic> json)  {
    if (json["books"] != null) {
      books = new List<Book>();
      json['books'].forEach((v) {
        Book _book = new Book.fromJson(v);
        books.add(_book);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  String id;
  String title;
  String description;
  String urlTextSource;
  String language;
  String copyrightYear;
  String numSections;
  String urlRss;
  String urlZipFile;
  String urlProject;
  String urlLibrivox;
  Null urlOther;
  String totaltime;
  int totaltimesecs;
  List<Authors> authors;
  String urlImage;

  Book(
      {this.id,
      this.title,
      this.description,
      this.urlTextSource,
      this.language,
      this.copyrightYear,
      this.numSections,
      this.urlRss,
      this.urlZipFile,
      this.urlProject,
      this.urlLibrivox,
      this.urlOther,
      this.totaltime,
      this.totaltimesecs,
      this.authors});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    urlTextSource = json['url_text_source'];
    language = json['language'];
    copyrightYear = json['copyright_year'];
    numSections = json['num_sections'];
    urlRss = json['url_rss'];
    urlZipFile = json['url_zip_file'];
    urlProject = json['url_project'];
    urlLibrivox = json['url_librivox'];
    urlOther = json['url_other'];
    totaltime = json['totaltime'];
    totaltimesecs = json['totaltimesecs'];
    if (json['authors'] != null) {
      authors = new List<Authors>();
      json['authors'].forEach((v) {
        authors.add(new Authors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url_text_source'] = this.urlTextSource;
    data['language'] = this.language;
    data['copyright_year'] = this.copyrightYear;
    data['num_sections'] = this.numSections;
    data['url_rss'] = this.urlRss;
    data['url_zip_file'] = this.urlZipFile;
    data['url_project'] = this.urlProject;
    data['url_librivox'] = this.urlLibrivox;
    data['url_other'] = this.urlOther;
    data['totaltime'] = this.totaltime;
    data['totaltimesecs'] = this.totaltimesecs;
    if (this.authors != null) {
      data['authors'] = this.authors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Authors {
  String id;
  String firstName;
  String lastName;
  String dob;
  String dod;

  Authors({this.id, this.firstName, this.lastName, this.dob, this.dod});

  Authors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    dod = json['dod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['dob'] = this.dob;
    data['dod'] = this.dod;
    return data;
  }
}
