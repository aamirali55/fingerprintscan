import 'package:local_auth/local_auth.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final LocalAuthentication _auth = LocalAuthentication();
  String _authMessage = "Authenticate with fingerprint";

  String get authMessage => _authMessage;

 
  Future<void> authenticate() async {
    setBusy(true); 
    try {
      print("Attempting fingerprint authentication...");
      bool authenticated = await _auth.authenticate(
        localizedReason: 'Place your finger on the sensor to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      print("Authentication result: $authenticated");

      _authMessage =
          authenticated ? "Authentication Successful" : "Authentication Failed";
    } catch (e) {
      print("Authentication error: $e");
      _authMessage = "Error: ${e.toString()}";
    }
    setBusy(false); 
    notifyListeners();
  }
}
