import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/thing.dart';
import '../Models/envelope.dart';

class DetaService {
  final key = '';
  final id = '';

  Future<bool> postThing(Thing thing) async {
    final url = 'https://database.deta.sh/v1/$id/basicthings/items';
    final uri = Uri.parse(url);
    final envelope = Envelope(thing);
    final string = jsonEncode(envelope);
    await http
        .post(
      uri,
      headers: {
        'X-API-Key': key,
        'content-type': 'application/json',
      },
      body: string,
    )
        .then((response) {
      if (response.statusCode < 300) {
        return true;
      }
    });
    return false;
  }
}
