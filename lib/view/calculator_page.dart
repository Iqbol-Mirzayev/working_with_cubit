import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Widget calcButton(String btntxt, Color btnColor, Color txtColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 80,
        decoration: BoxDecoration(color: btnColor, shape: BoxShape.circle),
        child: InkWell(
          onTap: () {
            calculation(btntxt);
          },
          child: Center(
            child: Text(
              btntxt,
              style: TextStyle(color: txtColor, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 70, color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("C", Colors.amber, Colors.red),
              calcButton("( )", Colors.amber, Colors.white),
              calcButton("%", Colors.amber, Colors.white),
              calcButton("/", Colors.amber, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("7", Colors.grey, Colors.white),
              calcButton("8", Colors.grey, Colors.white),
              calcButton("9", Colors.grey, Colors.white),
              calcButton("x", Colors.amber, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("4", Colors.grey, Colors.white),
              calcButton("5", Colors.grey, Colors.white),
              calcButton("6", Colors.grey, Colors.white),
              calcButton("-", Colors.amber, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("1", Colors.grey, Colors.white),
              calcButton("2", Colors.grey, Colors.white),
              calcButton("3", Colors.grey, Colors.white),
              calcButton("+", Colors.amber, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("+/-", Colors.amber, Colors.white),
              calcButton("0", Colors.grey, Colors.white),
              calcButton(".", Colors.amber, Colors.white),
              calcButton("=", Colors.amber, Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}

/*

Center(
        child: BlocBuilder<CalculatorCubit, CalculatorState>(
          builder: (context, state) {
            if (state is CalculatorInitialState) {
              return const Center(
                child: Text("Hali Hisoblanmadi"),
              );
            } else if (state is AdditionResultState) {
              return Text(
                "Yig'indining qiymati ${state.result}",
              );
            } else if (state is SubsturtionResultState) {
              return Text("Ayirmaning qiymati : ${state.result}");
            } else if (state is MultiplyResultState) {
              return Text(
                "Ko'paytmaning  qiymati : ${state.result}",
              );
            } else if (state is DivisionResultState) {
              return Text("Bo'linmaning qiymati ${state.result}");
            }
            return const SizedBox();
          },
        ),
      ),





//////////////////////////////
  floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CalculatorCubit>().addNumbers(10, 21),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<CalculatorCubit>().divisionNumbers(20, 20),
            child: const Icon(Icons.scuba_diving),
          ),FloatingActionButton(
            onPressed: () =>
                context.read<CalculatorCubit>().multiplyNumbers(12, 12),
            child: const Icon(Icons.ac_unit_outlined),
          ),FloatingActionButton(
            onPressed: () =>
                context.read<CalculatorCubit>().substractNumbers(12, 3),
            child: const Icon(Icons.remove),
          ),
        ],
      ),

*/
