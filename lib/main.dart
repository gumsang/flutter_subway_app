import 'package:flutter/material.dart';
import 'package:flutter_subway_api/data/data_source/remote/subway_api_impl.dart';
import 'package:provider/provider.dart';

import 'data/repository/subway_repository_impl.dart';
import 'ui/main/subway_screen.dart';
import 'ui/main/subway_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) =>
            SubwayScreenViewModel(SubwayRepositoryImpl(SubwayApiImpl())),
        child: const SubwayScreen(),
      ),
    );
  }
}
