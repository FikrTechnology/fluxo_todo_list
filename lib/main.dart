import 'package:flutter/material.dart';
import 'package:fluxo_todo_list/core/injection_container.dart' as di;
import 'package:fluxo_todo_list/core/theme/app_theme.dart';
import 'package:fluxo_todo_list/routes/navigation_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
