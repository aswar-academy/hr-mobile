import 'package:aswar/logic/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(data);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
