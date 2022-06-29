import 'package:flutter/material.dart';
import 'package:siteweb/screens/Archive.dart';
import 'package:siteweb/screens/DemandePriseenCharge/CreerDemande.dart';
import 'package:siteweb/screens/DemandePriseenCharge/homePage.dart';
import 'package:siteweb/screens/login/Login.dart';
import 'package:siteweb/screens/parametres.dart';
import 'package:siteweb/screens/remboursement/remboursement.dart';
import 'package:sizer/sizer.dart';

import 'constant.dart';
import 'models/Demande.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Color(0xFFFF083454)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Login(),
          onGenerateRoute: (settings) {
            final page = _getPageWidget(settings);
            if (page != null) {
              return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => page,
                  transitionsBuilder: (_, anim, __, child) {
                    return FadeTransition(
                      opacity: anim,
                      child: child,
                    );
                  });
            }
            return null;
          },
        );
      },
    );
  }
}

Widget? _getPageWidget(RouteSettings settings) {
  if (settings.name == null) {
    return null;
  }
  final uri = Uri.parse(settings.name!);
  switch (uri.path) {
    case '/demandes':
      return HomePage();
    case '/Login':
      return Login();
    case '/remboursement':
      return Remboursement();
    case '/Parametres':
      return Parametres();
    case '/Archive':
      return Archive();
    case '/CreerDemande':
      return CreerDemande();
  }
  return null;
}
