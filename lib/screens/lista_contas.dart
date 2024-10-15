import 'package:flutter/material.dart';

class ContasListScreen extends StatefulWidget {
  @override
  _ContasListScreenState createState() => _ContasListScreenState();
}

class _ContasListScreenState extends State<ContasListScreen> {
  List<Conta> _contas = [];

  ListView.builder(
  itemCount: _contas.length,
  itemBuilder: (context, index) {
    final conta = _contas[index];
    return ListTile(
      title: Text(conta.titular),
      subtitle: Text('Saldo: R\$ ${conta.saldo.toStringAsFixed(2)}'),
    );
  },
),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}