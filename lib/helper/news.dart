import 'dart:convert';

import 'package:newspaper_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNewsUrl() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=c6ad57c072e442b29ccb8e8e1ea66af4';

    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'].toString(),
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNewsUrl(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=c6ad57c072e442b29ccb8e8e1ea66af4';

    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'].toString(),
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
