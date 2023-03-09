import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:redux/redux.dart';
import 'package:test_redux/features/auth/models/login_model.dart';

import 'app_redux/app_middleware.dart';
import 'app_redux/app_reducer.dart';
import 'app_redux/app_state.dart';
import 'features/auth/redux/auth_actions.dart';
import 'features/connectivity/redux/connectivity_actions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Declaring store
  final store = Store<AppState>(
    appReducer,
    initialState: const AppState(),
    middleware: appMiddleware,
  );

  //#region internet connection check and status change by redux
  final customInstance = InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1), // Custom check timeout
    checkInterval: const Duration(seconds: 1), // Custom check interval
  );

  customInstance.onStatusChange.listen(
    (event) async {
      debugPrint('InternetConnectionChecker Connection value: ${event.name}');
      bool result = await InternetConnectionChecker().hasConnection;
      debugPrint('InternetConnectionChecker result: $result');

      if (result && !store.state.isInternetConnected) {
        store.dispatch(IsConnectedAction());
        debugPrint('Connect dispatched');
      } else if (!result && store.state.isInternetConnected) {
        store.dispatch(IsDisconnectedAction());
        debugPrint('Disconnect dispatched');
      }
    },
  );
  //#endregion

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp(this.store, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', store: store),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Store<AppState> store;

  const MyHomePage({super.key, required this.title, required this.store});

  final String title;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StoreConnector<AppState, AppState>(
                converter: (Store<AppState> store) {
                  return store.state;
                },
                builder: (BuildContext context, fullState) {
                  return Text(
                    'State is: ${fullState.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 26),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: StoreConnector<AppState, VoidCallback>(
          converter: (Store<AppState> store) {
            return () => store.state.isLoading
                ? store.dispatch(LoginErrorAction(Exception('Hello')))
                : store.dispatch(
                    LoginRequestAction(LoginModel(userName: '', password: '')));
          },
          builder: (BuildContext context, callBack) {
            return FloatingActionButton(
              onPressed: callBack,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
