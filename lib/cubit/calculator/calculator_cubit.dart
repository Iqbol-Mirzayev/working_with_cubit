import 'package:base_bloc/cubit/calculator/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitialState());

  void addNumbers(double a, double b) {
    double result = a + b;

    emit(AdditionResultState(result: result));
  }

  void substractNumbers(double a, double b) {
    double result = a - b;

    emit(SubsturtionResultState(result: result));
  }

  void multiplyNumbers(double a, double b) {
    double result = a * b;

    emit(MultiplyResultState(result: result));
  }

  void divisionNumbers(double a, double b) {
    double result = a / b;

    emit(DivisionResultState(result: result));
  }

  void calculate(double a, double b, int operationType) {
    switch (operationType) {
      case 1:
        emit(UniversalState(result: a + b));
        break;
      case 2:
        emit(UniversalState(result: a + b));
        break;
      case 3:
        emit(UniversalState(result: a - b));
        break;
      default:
        emit(UniversalState(result: a / b));
    }
  }
}
