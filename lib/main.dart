import 'package:flutter/material.dart';
import 'package:mvvmflutter/utils/route/routes.dart';
import 'package:mvvmflutter/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/route/routes_name.dart';
import 'view_model/user_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewMode()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
        child: MaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
