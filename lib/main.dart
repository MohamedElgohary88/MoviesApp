import 'package:flutter/material.dart';
import 'package:movies_app/app_router.dart';

void main() {
  runApp(RicklantisApp(appRouter: AppRouter()));
}

class RicklantisApp extends StatelessWidget {

  final AppRouter appRouter;

  const RicklantisApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
