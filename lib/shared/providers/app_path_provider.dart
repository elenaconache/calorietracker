import 'package:path_provider/path_provider.dart';

class AppPathProvider {
  String? _path;

  String get path {
    if (_path != null) {
      return _path!;
    } else {
      throw Exception('Application path not initialized');
    }
  }

  Future<void> initPath() async {
    final dir = await getApplicationDocumentsDirectory();
    _path = dir.path;
  }
}
