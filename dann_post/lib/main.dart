import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dann_post/ModelsAndServices/services/authentication_service.dart';
import 'package:dann_post/locator.dart';
import 'package:dann_post/ui/router.dart';

import 'ModelsAndServices/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}