import 'package:flutter_app/layout/cubit/states.dart';
import 'package:flutter_app/modules/business/business_screen.dart';
import 'package:flutter_app/modules/counter/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  var myWidgets =
  [
    BusinessScreen('business'),
    BusinessScreen('sports'),
  ];

  // var selectedItems =
  // [
  //   true,
  //   false,
  // ];

  var myTitles =
  [
    'Business',
    'Sports',
  ];

  changeIndex(index)
  {
    currentIndex = index;
    //selectedItems[index] = !selectedItems[index];
    emit(HomeIndexState());
  }
}