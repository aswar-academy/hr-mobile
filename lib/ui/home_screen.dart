import 'package:aswar/swagger_generated_code/openapi.swagger.dart';
import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title});

  final String title;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _counter = 0;

  ResultState<List<UserData>> usersState = const ResultState.idle();

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
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Text(item.email);
                  },
                );
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
