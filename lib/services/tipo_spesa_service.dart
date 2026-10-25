import 'dart:convert';

import 'package:gestione_spese_client/models/tipo_spesa.dart';
import 'package:http/http.dart' as http;

class TipoSpesaService {

  static const String baseUrl = 'http://localhost:5000/gestione_spese_server/tipo_spesa';

  //getAll
  Future<List<TipoSpesa>> getAll() async{

    final response = await http.get(Uri.parse("$baseUrl/getAll"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      List<TipoSpesa> listResponse = jsonResponse.map((item) =>
          TipoSpesa.fromJson(item as Map<String, dynamic>)).toList();

      print("[Tipo_Spesa_Service]: getAll is OK!");

      return listResponse;

    } else {

      throw Exception('Errore di comunicazione col server: ${response.statusCode}');

    }

  }

  //getById
  Future<TipoSpesa> getById(int id) async{
    final response = await http.get(Uri.parse("$baseUrl/getById/$id"));

    if (response.statusCode == 200) {
      final dynamic jsonResponse = jsonDecode(response.body);

      TipoSpesa tipoSpesaResponse = TipoSpesa.fromJson(
          jsonResponse as Map<String, dynamic>);

      print("[Tipo_Spesa_Service]: getById is OK!");

      return tipoSpesaResponse;

    } else{

      throw Exception('Errore di comunicazione col server: ${response.statusCode}');

    }
  }

  //create
  Future<TipoSpesa> create(String nome) async{

    var body = { "nome" : nome };

    final response = await http.post(Uri.parse("$baseUrl/create"), body: body);

    if (response.statusCode == 200) {
      final dynamic jsonResponse = jsonDecode(response.body);

      TipoSpesa tipoSpesaResponse = TipoSpesa.fromJson(
          jsonResponse as Map<String, dynamic>);

      print("[Tipo_Spesa_Service]: create is OK!");

      return tipoSpesaResponse;

    } else{

      throw Exception('Errore di comunicazione col server: ${response.statusCode}');

    }

  }

  //update
  Future<TipoSpesa> update(int id, String nome) async{

    var body = { "nome" : nome };

    final response = await http.put(Uri.parse("$baseUrl/update/$id"), body: body);

    if (response.statusCode == 200) {
      final dynamic jsonResponse = jsonDecode(response.body);

      TipoSpesa tipoSpesaResponse = TipoSpesa.fromJson(
          jsonResponse as Map<String, dynamic>);

      print("[Tipo_Spesa_Service]: update is OK!");

      return tipoSpesaResponse;

    } else{

      throw Exception('Errore di comunicazione col server: ${response.statusCode}');

    }

  }

  //delete
  Future<bool> delete(int id) async{

    final response = await http.delete(Uri.parse("$baseUrl/delete/$id"));

    if (response.statusCode == 200) {

      print("[Tipo_Spesa_Service]: delete is OK!");

      return true;

    } else{

      throw Exception('Errore di comunicazione col server: ${response.statusCode}');

    }

  }

}