import 'package:f_shopping_app/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:f_shopping_app/ui/stprovider.dart';

void main() => runApp(
    ChangeNotifierProvider(
      create: (context) => StProvider(),
      child: const MyApp(),
    ),
);
