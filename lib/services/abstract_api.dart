import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AbstractApi<T, D extends ConverterApi<T>> {

  static const url = 'http://localhost:3000';

  String rota();

  Future<List<T>> getAll() async {
    var response = await http.get(Uri.parse('$url/${rota()}'));
    List<Map<String, dynamic>> lista = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    List<T> novaLista = [];
    for (var l in lista) {novaLista.add(converter().deserializer(l));}
    return novaLista;
  }

  Future<String> getById(int id) async {
    return (await http.get(Uri.parse('$url/${rota()}/$id'))).body;
  }

  Future<String> post(dynamic body) async {
    return (await http.post(Uri.parse('$url/${rota()}'), body: JsonEncoder(body))).body;
  }

  Future<String> put(int id, dynamic body) async {
    return (await http.put(Uri.parse('$url/${rota()}/$id'), body: JsonEncoder(body))).body;
  }

  Future<void> delete(int id, dynamic body) async {
    await http.delete(Uri.parse('$url/${rota()}/$id'));
  }
}