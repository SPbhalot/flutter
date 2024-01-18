import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  late final String Token;

  Future setToken(String Token) async {
    await storage.write(key: 'Token_id', value: Token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'Token_id');
  }
void DeleteToken() async {
    return await storage.delete(key: 'Token_id');
  }

   Future<bool> hasToken() async {
    if (await storage.read(key: 'Token_id') != null) {
      return true;
    } else {
      return false;
    }
  }
}
