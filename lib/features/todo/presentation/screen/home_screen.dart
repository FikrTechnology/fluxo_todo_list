import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluxo_todo_list/core/constants/app_colors.dart';
import 'package:fluxo_todo_list/core/constants/app_text_styles.dart';
import 'package:fluxo_todo_list/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }

            if (state is TodoError) {
              return Center(child: Text(state.message),);
            }

            if (state is TodoLoaded) {
              final todos = state.todos;
              final total = todos.length;
              final completed = todos.where((t) => t.status == 'DONE').length;
              print('Total: $total, Completed: $completed');
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: AppColors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily Progress',
                              style: AppTextStyles.body2.copyWith(
                                color: AppColors.lavenderBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  completed.toString(),
                                  style: AppTextStyles.heading2.copyWith(
                                    fontSize: 36,
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '/ $total tasks',
                                  style: AppTextStyles.subTitle1.copyWith(
                                    color: AppColors.lavenderBlue,
                                    height: 0,
                                  ),
                                ),
                                Spacer(),
                                SvgPicture.asset(
                                  'assets/icons/icoTask.svg',
                                  width: 48,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            LinearProgressBar(
                              maxSteps: total == 0 ? 1 : total,
                              currentStep: completed,
                              progressType: ProgressType.linear,
                              backgroundColor: AppColors.black.withOpacity(0.2),
                              progressColor: AppColors.white,
                              borderRadius: BorderRadiusGeometry.circular(50),
                              minHeight: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return ListTile(
                          title: Text(todo.title),
                          subtitle: Text(todo.description),
                          trailing: Text(todo.category),
                          // onTap: () => context.goNamed(...),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            // State awal
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
