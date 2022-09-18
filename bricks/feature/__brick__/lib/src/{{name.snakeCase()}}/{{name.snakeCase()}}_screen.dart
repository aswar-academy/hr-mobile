import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '{{name.snakeCase()}}_state.dart';
import '{{name.snakeCase()}}_cubit.dart';

class {{name.pascalCase()}}Screen extends StatefulWidget {
  const {{name.pascalCase()}}Screen({super.key});
  
  @override
  State<{{name.pascalCase()}}Screen> createState() => _{{name.pascalCase()}}ScreenState();
}

class _{{name.pascalCase()}}ScreenState extends State<{{name.pascalCase()}}Screen> {
  @override
  void initState() {
    super.initState();
    context.read<{{name.pascalCase()}}Cubit>();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        builder: (context, state) {
          return Text("$state");
        },
      ),
    );
  }
}