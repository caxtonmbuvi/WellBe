
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:interview_app/features/journal/cubit/journal_cubit.dart';
import 'package:interview_app/features/mood/repo/mood_repository.dart';
import 'package:interview_app/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:interview_app/features/onboarding/repo/onboarding_repository.dart';
import 'package:interview_app/features/wearable/cubit/wearable_cubit.dart';
import 'package:interview_app/features/wearable/repo/wearable_repository.dart';
class GlobalCubitProvider extends StatelessWidget {
  const GlobalCubitProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(OnboardingRepository()),
        ),
        BlocProvider(
          create: (context) => JournalCubit(),
        ),
        BlocProvider(
          create: (context) => DashboardCubit(MoodRepository()),
        ),
        BlocProvider(
          create: (context) => WearableCubit(WearableRepository()),
        ),
        
      ],
      child: child,
    );
  }
}
