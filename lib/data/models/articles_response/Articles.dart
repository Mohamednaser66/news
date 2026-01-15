import 'package:news/data/models/sources_response/Source.dart';
import 'package:news/domain/entites/article_entity.dart';


/// source : {"id":"wired","name":"Wired"}
/// author : "Joel Khalili"
/// title : "A False Start on the Road to an All-American Bitcoin"
/// description : "Donald Trump pledged to cement the US as the bitcoin mining capital of the planet. The president’s sweeping tariffs stand to simultaneously undermine and advance that ambition in one swoop."
/// url : "https://www.wired.com/story/a-false-start-on-the-road-to-an-all-american-bitcoin/"
/// urlToImage : "https://media.wired.com/photos/68531ba03ca23a58119ac365/191:100/w_1280,c_limit/061825-amercian-bitcoin-false-start.jpg"
/// publishedAt : "2025-06-20T09:30:00Z"
/// content : "Mining firms are also facing heightened competition for limited energy resources in the US, mostly from AI companies flush with venture funding. New projections from the US Department of Energy indic… [+3401 chars]"

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

  ArticleEntity toArticleEntity()=> ArticleEntity(title: title,description: description,author: author,publishedAt: publishedAt,url: url,urlToImage: urlToImage);

}