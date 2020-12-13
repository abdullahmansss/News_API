import 'package:dio/dio.dart';
import 'package:flutter_app/modules/business/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessCubit extends Cubit<BusinessStates>
{
  BusinessCubit() : super(BusinessInitialState());

  static BusinessCubit get(context) => BlocProvider.of(context);

  List articles = [];

  getBusiness(text) async
  {
    emit(BusinessLoadingState());

    Dio dio = Dio();
    dio.options.baseUrl = 'http://newsapi.org/';

    await dio.get(
      'v2/top-headlines',
      queryParameters: {
        'country': 'eg',
        'category': '$text',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      articles = value.data['articles'] as List;

      emit(BusinessSuccessState());
    }).catchError((e)
    {
      emit(BusinessErrorState(e.toString()));
    });
  }
}