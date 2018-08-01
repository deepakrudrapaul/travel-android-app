import 'package:wanderwagon/network/mock_service.dart';
import 'package:wanderwagon/network/wanderwagon_service.dart';
import 'package:wanderwagon/network/wanderwagon_service_impl.dart';

enum BuildType { DEV, PROD }

class ServiceInjector {
  static final ServiceInjector _singleton = ServiceInjector._internal();

  static BuildType _buildType;

  static void configure(BuildType buildType) {
    _buildType = buildType;
  }

  factory ServiceInjector() {
    return _singleton;
  }

  ServiceInjector._internal();

  WanderwagonService get wanderwagonService {
    switch (_buildType) {
      case BuildType.DEV:
        return MockService();
      default:
        return WanderwagonServiceImpl();
    }
  }
}
