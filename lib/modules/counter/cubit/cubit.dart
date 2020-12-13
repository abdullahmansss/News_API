import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int count = 0;

  add()
  {
    count ++;

    emit(CounterPlusState(count.toString()));
  }

  minus()
  {
    count --;

    emit(CounterMinusState());
  }
}