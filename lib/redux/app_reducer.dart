import '../features/auth/redux/auth_reducer.dart';
import '../features/connectivity/redux/connectivity_reducer.dart';
import 'app_state.dart';
import 'loading_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    loggedUser: authReducer(state.loggedUser, action),
    isInternetConnected: connectivityReducer(state.isInternetConnected, action),
  );
}
