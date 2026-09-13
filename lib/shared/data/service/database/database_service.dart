import 'package:calorietracker/objectbox.g.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@preResolve
class DatabaseService {
  late final Store store;

  @PostConstruct(preResolve: true)
  Future<void> init({@Named('appDirectoryPath') String? appDirectory}) async {
    store = await openStore(directory: appDirectory);
  }
}
