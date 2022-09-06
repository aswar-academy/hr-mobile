import 'package:aswar_hr_mobile/swagger_generated_code/openapi.swagger.dart';
import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  ResultState<List<UserData>> usersState = const ResultState.idle();

  @override
  void initState() {
    super.initState();

    final client = Openapi.create(
      baseUrl: "https://shrouded-fortress-33438.herokuapp.com/",
    );

    final value = client.usersGet(role: UsersGetRole.admin);
    print(value);

    safeApiCall(
      client.usersGet(role: UsersGetRole.user).transform,
      logger: stateLogger,
    ).listen((event) => setState(() => usersState = event));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            usersState.maybeWhen(
              data: (data, response) {
                return const Text("hello");
              },
              error: (error) {
                return const Text("error");
              },
              orElse: SizedBox.shrink,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
