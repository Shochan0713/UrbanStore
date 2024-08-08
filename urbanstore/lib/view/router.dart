import 'package:go_router/go_router.dart';
import 'package:urbanstore/view/product_related/HomeScreen.dart';

final router =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      name: 'home', path: '/', builder: (context, state) => const HomeScreen())
]);
