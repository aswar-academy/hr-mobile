import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '{{name.snakeCase()}}_bloc.dart';

class {{name.pascalCase()}} extends StatefulWidget {
  const {{name.pascalCase()}}({super.key});
  
  @override
  State<{{name.pascalCase()}}> createState() => _{{name.pascalCase()}}State();
}

class _{{name.pascalCase()}}State extends State<{{name.pascalCase()}}> {
  @override
  void initState() {
    super.initState();
    context.read<{{name.pascalCase()}}Cubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container()
    );
  }
}