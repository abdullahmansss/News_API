import 'package:flutter/material.dart';
import 'package:flutter_app/modules/business/business_screen.dart';

void main()
{
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

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BusinessScreen(),
    );
  }
}