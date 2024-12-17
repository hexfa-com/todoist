import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/presentation/bloc/project_bloc.dart';
import 'package:todoist/presentation/views/project_page.dart';
import 'core/di/di.dart';

void main() {
  const token = 'fd1df697c8622b190f2f2999047342d91e90690b';

  setupLocator(token);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoist Projects',
      home: BlocProvider(
        create: (_) => getIt<ProjectsBloc>(),
        child: ProjectsPage(),
      ),
    );
  }
}
