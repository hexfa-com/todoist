import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist/presentation/bloc/project_bloc.dart';
import 'package:todoist/presentation/views/project_page.dart';
import 'core/di/di.dart';

void main() {
  const token = '0123456789abcdef0123456789';

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
