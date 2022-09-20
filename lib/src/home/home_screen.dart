import 'package:aswar/common_libs.dart';
import 'package:aswar/src/component/app_button.dart';
import 'package:aswar/src/component/header.dart';
import 'package:aswar/src/home/task_list_tile.dart';
import 'package:aswar/src/home/user_detail_extension.dart';
import 'package:aswar/ui/logo.dart';
import 'package:aswar/ui/utils.dart';
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
        builder: (context, HomeState state) {
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
                    state.maybeWhen(
                      data: _buildHeaderContent,
                      orElse: Spacer.new,
                    ),
                    Expanded(child: _buildNavigation(state).animate().fadeIn()),
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

  Widget _buildNavigation(HomeState state) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        NavigationListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.teal,
          title: context.localizations.profile,
          description: context.localizations.profileSubtitle,
          onPressed: () {
            context.router.push(const ProfileRoute());
          },
        ),
        NavigationListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.purple,
          title: context.localizations.tasks,
          description: context.localizations.tasksSubtitle(1),
          onPressed: () {
            context.router.push(const MyTasksRoute());
          },
        ),
        NavigationListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.blue,
          title: context.localizations.department,
          description: context.localizations.departmentSubtitle,
          onPressed: () {
            context.router.push(const MyDepartmentRoute());
          },
        ),
        NavigationListTile(
          icon: Icons.person_rounded,
          iconColor: Colors.amber,
          title: context.localizations.payroll,
          description: "",
          onPressed: context.showUnderDevelopment,
        ),
      ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: $styles.insets.xs),
                      child: Text(
                        context.localizations.greeting(homeData.user.name),
                        style: $styles.text.h3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Gap($styles.insets.xs),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: $styles.insets.xs),
                      child: Text(
                        homeData.user.jobTitle,
                        style: $styles.text.title1.copyWith(
                          color: $styles.colors.accent,
                        ),
                      ),
                    ),
                  ],
                ),
                const AswarLogo(),
              ],
            ),
            Gap($styles.insets.sm),
            Row(
              children: [
                TaskState(
                  count: homeData.tasksCount.todo,
                  title: context.localizations.todoTask,
                ),
                divider,
                TaskState(
                  count: homeData.tasksCount.doing,
                  title: context.localizations.doingTask,
                ),
                divider,
                TaskState(
                  count: homeData.tasksCount.done,
                  title: context.localizations.doneTask,
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn();
  }

  void _onAddTaskPressed() {
    context.router.push(const AddTaskRoute());
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
