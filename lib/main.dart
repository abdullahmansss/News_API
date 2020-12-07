import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class QuestionsModel
{
  bool status;
  int count;
  int count_total;
  int pages;
  List<PostsModel> posts;
}

class PostsModel
{
  int id;
  String title;
  String excerpt;
  String date;
  List<CategoriesModel> categories;
  List<CategoriesModel> tags;
  AuthorModel author;
  String thumbnail;
  bool favorite;
}

class CategoriesModel
{
  int id;
  String name;
}

class AuthorModel
{
  int id;
  String name;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Container(),
    );
  }
}