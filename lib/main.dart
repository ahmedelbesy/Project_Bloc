import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/post_bloc.dart';
import 'package:test_bloc/screen/home_screen.dart';

import 'repository/post_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PostRepository().fetchPosts();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (ctx) => PostBloc(PostInitial(), PostRepository()),
        child: Home_Screen(),
      ),
    );
  }
}
