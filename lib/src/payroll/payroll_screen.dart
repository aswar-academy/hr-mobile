import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/ui/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payroll_cubit.dart';
import 'payroll_state.dart';

class PayrollScreen extends StatefulWidget {
  const PayrollScreen({super.key});

  @override
  State<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends State<PayrollScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PayrollCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<PayrollCubit, PayrollState>(
        builder: (context, state) {
          return Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                child: Header(minHeight: 350),
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    AppButton(
                      onPressed: _onAddTaskPressed,
                      title: context.localizations.addNewTask,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _onAddTaskPressed() {}
}
