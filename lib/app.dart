import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/invoice_provider.dart';
import 'screens/landing_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InvoiceProvider()),
      ],
      child: MaterialApp(
        title: 'Invoice Generator',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/landing',
        routes: {
          '/landing': (context) => LandingPage(),
          // Add other routes as implemented
        },
      ),
    );
  }
}