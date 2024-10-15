import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bank_app/models/conta.dart';

abstract class ContaService {
  static const String baseUrl = 'http://localhost:3000/contas';

  static Future<List<Conta>> getContas() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Conta.fromJson(json)).toList();
    } else {
      throw Exception('Falha pra carregar as contas');
    }
  }

  static Future<Conta> createConta(Conta conta) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(conta.toJson()),
    );

    if (response.statusCode == 201) {
      return Conta.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar conta');
    }
  }

  static Future<Conta> updateConta(Conta conta) async {
    final response = await http.put(
      Uri.parse('${baseUrl}/${conta.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(conta.toJson()),
    );

    if (response.statusCode == 200) {
      return Conta.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao dar update na conta');
    }
  }

  static Future<void> deleteConta(int id) async {
    final response = await http.delete(Uri.parse('${baseUrl}/$id'));

    if (response.statusCode != 204) {
      throw Exception('Falha ao deletar conta');
    }
  }
}
}