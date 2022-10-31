import 'dart:io';

Future<bool> isConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
    // ignore: nullable_type_in_catch_clause
  } on SocketException catch (_) {
    return false;
  } on Exception catch (e) {
    return false;
  }
}