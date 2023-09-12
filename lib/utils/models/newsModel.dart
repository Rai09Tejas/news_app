import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModal {
  final String? author;
  final String? title;
  final String? publishedAt;
  final String? description;
  final String? content;
  final String? url;
  final String? urlToImage;
  final Map source;

  NewsModal({
    required this.author,
    required this.title,
    required this.publishedAt,
    required this.description,
    required this.content,
    required this.url,
    required this.urlToImage,
    required this.source,
  });

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "publishedAt": publishedAt,
        "description": description,
        "content": content,
        "url": url,
        "urlToImage": urlToImage,
        "source": source,
      };

  factory NewsModal.fromJson(Map<dynamic, dynamic> json) => NewsModal(
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        description: json["description"] ?? "",
        content: json["content"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ??
            "https://media.istockphoto.com/id/933421794/vector/live-reportage-conceptual-logo-vector-illustration-created-with-microphones-equipment-and.jpg?s=1024x1024&w=is&k=20&c=vEROz2SwUIfLP6kQ1IPz_HHUKvukNctrypczcnbE0xQ=",
        source: json["source"] ?? {},
      );

  static NewsModal? fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return NewsModal(
      author: snapshot['author'],
      title: snapshot['title'],
      publishedAt: snapshot['publishedAt'],
      description: snapshot['description'],
      content: snapshot['content'],
      url: snapshot['url'],
      urlToImage: snapshot['urlToImage'],
      source: snapshot['source'],
    );
  }
}
