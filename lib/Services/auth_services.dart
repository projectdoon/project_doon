import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mydoon/Providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> handleLogin(WidgetRef ref, String tokenFromBackend)async{
  final prefs=await SharedPreferences.getInstance();
  await prefs.setString('token', tokenFromBackend);

  ref.read(tokenProvider.notifier).setToken(tokenFromBackend);
}