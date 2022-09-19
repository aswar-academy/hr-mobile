import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payroll_state.dart';
import 'payroll_cubit.dart';

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
      body: BlocBuilder<PayrollCubit, PayrollState>(
        builder: (context, state) {
          return Text("$state");
        },
      ),
    );
  }
}