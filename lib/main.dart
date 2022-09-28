import 'package:base_bloc/cubit/calculator/calculator_cubit.dart';
import 'package:base_bloc/cubit/counter/counter_cubit.dart';
import 'package:base_bloc/view/calculator_page.dart';
import 'package:base_bloc/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blueGrey,
      ),
      home:BlocProvider(
        child: const CalculatorPage(),
        create:(_)=> CalculatorCubit())
        
    );
  }
}
