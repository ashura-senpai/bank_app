import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bank_app/screens/home.dart';
import 'package:flutter_bank_app/screens/lista_contas.dart';
import 'package:flutter_bank_app/services/conta_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContaProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/contas': (context) => ContasListScreen(),
        },
      ),
    ),
  );
}