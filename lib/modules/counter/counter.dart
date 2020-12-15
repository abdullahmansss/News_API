import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/counter/cubit/cubit.dart';
import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state)
      {
        if(state is CounterPlusState)
        {
          print('plus');
          print('${state.number}');
        }

        if(state is CounterMinusState)
        {
          print('minus');
        }
      },
      builder: (context, state)
      {
        return Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'minus',
                  onPressed: ()
                  {
                    CounterCubit.get(context).minus();
                  },
                  child: Text('minus'),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  CounterCubit.get(context).count.toString(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                FloatingActionButton(
                  heroTag: 'plus',
                  onPressed: ()
                  {
                    CounterCubit.get(context).add();
                  },
                  child: Text('plus'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}