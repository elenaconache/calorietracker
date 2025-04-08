import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class AppPathProvider {
  late String path;

  @PostConstruct(preResolve: true)
  Future<void> initPath() async {
    final dir = await getApplicationDocumentsDirectory();
    path = dir.path;
  }
}
