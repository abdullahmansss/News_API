import 'dart:ui';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BusinessScreen extends StatefulWidget {
  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen>
{
  List articles = [];

  @override
  void initState() {
    super.initState();

    getBusiness();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Business',
        ),
      ),
      body: ConditionalBuilder(
        condition: articles.length > 0,
        builder: (ctx) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) => buildItem(articles[index]),
          separatorBuilder: (ctx, index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: articles.length,
        ),
        fallback: (ctx) => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget buildItem(article) => Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          height: 120.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: NetworkImage(
                      article['urlToImage']??'https://www.logaster.com/blog/wp-content/uploads/2020/03/1010.png'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${article['title']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      '${article['source']['name']}',
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${article['publishedAt']}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void getBusiness() async
  {
    Dio dio = Dio();
    dio.options.baseUrl = 'http://newsapi.org/';

    await dio.get(
      'v2/top-headlines',
      queryParameters:
      {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      articles = value.data['articles'] as List;

      setState(()
      {

      });
    });
  }
}