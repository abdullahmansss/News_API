abstract class BusinessStates {}

class BusinessInitialState extends BusinessStates {}

class BusinessLoadingState extends BusinessStates {}

class BusinessSuccessState extends BusinessStates {}

class BusinessErrorState extends BusinessStates
{
  String error;

  BusinessErrorState(this.error);
}