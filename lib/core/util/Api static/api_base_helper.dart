import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://osamapro.online/api";
  final String? _token;

  ApiBaseHelper({String? token}) : _token = token;

  Map<String, String> get _headers {
    Map<String, String> headers = {};
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(_baseUrl + url),
        headers: _headers,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: _headers,
        body: body,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, Map<String, dynamic> body) async {
    var responseJson;
    try {
      final response = await http.put(
        Uri.parse(_baseUrl + url),
        body: body,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
