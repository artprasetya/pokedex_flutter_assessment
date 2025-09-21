// lib/services/graphql_service.dart
import 'package:dio/dio.dart';

class GraphQLService {
  final Dio dio;

  GraphQLService(this.dio);

  static const _api = 'https://graphql-pokemon2.vercel.app/';

  Future<Map<String, dynamic>> query(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    try {
      final response = await dio.post(
        _api,
        data: {'query': query, 'variables': variables ?? {}},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['errors'] != null) {
          throw Exception(data['errors'].toString());
        }
        return data['data'] as Map<String, dynamic>;
      } else {
        throw Exception('GraphQL error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('GraphQL request failed: $e');
    }
  }
}
