import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bank_app/models/conta.dart';
import 'package:flutter_bank_app/services/conta_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titularController = TextEditingController();
  final _saldoController = TextEditingController();

void _salvarConta() async {
    final conta = Conta(
      titular: _titularController.text,
      saldo: double.parse(_saldoController.text),
    );
    try {
      await Provider.of<ContaProvider>(context, listen: false).addConta(conta);
      _titularController.clear();
      _saldoController.clear();
      Navigator.pushNamed(context, '/contas');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar conta: $e')),
      );
    }
  }
}

class ContaProvider with ChangeNotifier {
  List<Conta> _contas = [];

  List<Conta> get contas => _contas;

  Future<void> fetchContas() async {
    _contas = await ContaService.getContas();
    notifyListeners();
  }

  Future<void> addConta(Conta conta) async {
    final newConta = await ContaService.createConta(conta);
    _contas.add(newConta);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }

final _formKey = GlobalKey<FormState>();

TextFormField(
  controller: _titularController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Digite o nome do titular';
    }
    return null;
  },
),

}