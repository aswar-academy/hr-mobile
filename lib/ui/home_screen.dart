import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ResultState<PaginatedUser> usersState = const ResultState.idle();

  @override
  void initState() {
    super.initState();

    final client = Openapi.create(
      baseUrl: "https://shrouded-fortress-33438.herokuapp.com",
    );

    safeApiCall(client.usersGet(role: UsersGetRole.user).transform)
        .listen((event) => setState(() => usersState = event));
  }

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
