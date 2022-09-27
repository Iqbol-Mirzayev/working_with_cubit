import 'package:base_bloc/cubit/calculator/calculator_cubit.dart';
import 'package:base_bloc/cubit/calculator/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}
////   nidnsanfinasdnansidnaosnd
///
///
///
///
///
class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Working with Cubit"),
      ),
      body: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          if (state is CalculatorInitialState) {
            return const Center(
              child: Text("Hali Hisoblanmadi"),
            );
          } else if (state is AdditionResultState) {
            return Text(
              "Yog'indining qiymati ${state.result}",
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
      floatingActionButton: Column(
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
    );
  }
}
