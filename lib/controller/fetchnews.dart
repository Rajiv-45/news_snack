import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_snack/controller/newsapimodel.dart';

class FetchNew {
  FetchNews? news;
  Future<FetchNews> fetchNews() async {
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=37971987eeb04f93b553452e841950b5"));
    Map<String, dynamic> body_data = jsonDecode(response.body);
    news = FetchNews.fromJson(body_data);

    print(news!.sources![0].country);
    return news!;
  }
}
