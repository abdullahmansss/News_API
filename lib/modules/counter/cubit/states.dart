abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterPlusState extends CounterStates
{
  String number;

  CounterPlusState(this.number);
}

class CounterMinusState extends CounterStates {}