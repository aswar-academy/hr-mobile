import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:aswar/src/home/task_list_tile.dart';
import 'package:aswar/src/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_cubit.dart';
import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final read = context.read<HomeCubit>();
    read.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                child: Header(
                  minHeight: 350,
                ),
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    state.maybeWhen(
                      data: _buildHeaderContent,
                      orElse: SizedBox.new,
                    ),
                    _buildNavigation(),
                    const Spacer(),
                    _buildAddTaskButton(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavigation() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        TasksListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.teal,
          title: $strings.profile,
          description: $strings.profileSubtitle,
          onPressed: () {
            // context.router.push(ProfileRoute());
          },
        ),
        TasksListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.purple,
          title: $strings.tasks,
          description: $strings.tasksSubtitle(1),
          onPressed: () {
            // context.router.push(TasksRoute());
          },
        ),
        TasksListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.blue,
          title: $strings.department,
          description: $strings.departmentSubtitle,
          onPressed: () {
            // context.router.push(DepartmentRoute());
          },
        ),
        TasksListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.amber,
          title: $strings.payroll,
          description: "time ago package",
          onPressed: () {
            // context.router.push(PayrollRoute());
          },
        ),
      ],
    );
  }

  Widget _buildAddTaskButton() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: TextButton(
        onPressed: () {
          // context.router.push(0Route());
        },
        child: Text(
          $strings.addNewTask,
          style: TextStyle(color: $styles.colors.black),
        ),
      ),
    );
  }

  Widget _buildHeaderContent(HomeData homeData, _) {
    const divider = SizedBox(
      height: 40,
      child: VerticalDivider(
        color: Colors.white,
      ),
    );

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              $strings.greeting(homeData.user.name),
              style: $styles.text.h3.copyWith(
                color: Colors.white,
              ),
            ),
            Gap($styles.insets.xs),
            Text(
              homeData.user.jobTitle,
              style: $styles.text.title1.copyWith(
                color: $styles.colors.accent,
              ),
            ),
            Gap($styles.insets.sm),
            Row(
              children: [
                TaskState(
                  count: homeData.tasksCount.todo,
                  title: $strings.todoTask,
                ),
                divider,
                TaskState(
                  count: homeData.tasksCount.doing,
                  title: $strings.doingTask,
                ),
                divider,
                TaskState(
                  count: homeData.tasksCount.done,
                  title: $strings.doneTask,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskState extends StatelessWidget {
  final String title;
  final int count;

  const TaskState({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TopCenter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$count",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: $styles.text.h3.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
