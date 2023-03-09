import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

import '../features/auth/redux/auth_middleware.dart';
import '../features/auth/repositories/auth_repository.dart';
import 'app_state.dart';

final List<
        dynamic Function(Store<AppState>, dynamic, dynamic Function(dynamic))>
    appMiddleware = [
  ...createAuthsMiddleware(AuthRepository()),
  LoggingMiddleware.printer(),
];
