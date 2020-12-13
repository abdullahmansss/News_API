import 'dart:ui';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/business/cubit/cubit.dart';
import 'package:flutter_app/modules/business/cubit/states.dart';
import 'package:flutter_app/modules/counter/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BusinessCubit()..getBusiness('business'),
      child: BlocConsumer<BusinessCubit, BusinessStates>(
        listener: (context, state) {
          if (state is BusinessErrorState) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          var list = BusinessCubit.get(context).articles;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Business',
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! BusinessLoadingState,
              builder: (ctx) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) => buildItem(list[index], context),
                separatorBuilder: (ctx, index) => Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
                itemCount: list.length,
              ),
              fallback: (ctx) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                BusinessCubit.get(context).getBusiness('sports');
              },
              child: Icon(
                Icons.list,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildItem(article, context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CounterScreen(),
            ),
          );
        },
        child: Padding(
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
                    image: NetworkImage(article['urlToImage'] ??
                        'https://www.logaster.com/blog/wp-content/uploads/2020/03/1010.png'),
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
        ),
      );
}
