import 'package:books_store/providers/base_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus {
  uninitialized,
  unauthenticated,
  authenticated,
  authenticating,
}

class AuthProvider extends BaseProvider {
  AuthStatus status = AuthStatus.uninitialized;
  String? token;

  Future<void> initAuthProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? tempToken = prefs.getString("token");

    if (tempToken != null) {
      status = AuthStatus.authenticated;
      token = tempToken;
      setBusy(false);
    } else {
      status = AuthStatus.unauthenticated;
      token = null;
      setBusy(false);
    }
  }

  void register() {}

  void login() {}

  void getMe() {}

  void logout() {}
}
