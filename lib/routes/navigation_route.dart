import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxo_todo_list/features/todo/presentation/screen/home_screen.dart';
import 'package:fluxo_todo_list/features/todo/presentation/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  restorationScopeId: null,
  redirect: (context, state) => null,
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    )
  ]
);