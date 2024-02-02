import 'package:catinfo/screen/cat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/cat_factory_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDoceumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDoceumentDirectory.path);
  await Hive.openBox('catsTime');
  await Hive.openBox('catsText');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider(
        create: (context) => CatFactoryBloc()..add(FactoryLoadEvent()),
        child: const CatVew(),
      )
    );
  }
}

