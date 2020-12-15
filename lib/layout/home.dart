import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/cubit/cubit.dart';
import 'package:flutter_app/layout/cubit/states.dart';
import 'package:flutter_app/modules/business/business_screen.dart';
import 'package:flutter_app/modules/counter/counter.dart';
import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var myIndex = HomeCubit.get(context).currentIndex;

        return Scaffold(
          appBar: AppBar(
            title: Text(HomeCubit.get(context).myTitles[myIndex]),
          ),
          body: HomeCubit.get(context).myWidgets[myIndex],
          // drawer: Drawer(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) => defaultList(
          //       HomeCubit.get(context).myTitles[index],
          //       index,
          //       context,
          //     ),
          //     itemCount: HomeCubit.get(context).myWidgets.length,
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: 'business',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: 'sports',
              ),
            ],
            onTap: (index) {
              HomeCubit.get(context).changeIndex(index);
            },
            currentIndex: myIndex,
          ),
        );
      },
    );
  }

  Widget defaultList(title, index, context) => ListTile(
        title: Text(
          '$title',
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
        ),
        onTap: () {
          HomeCubit.get(context).changeIndex(index);
          Navigator.pop(context);
        },
        selected: false,
      );
}
