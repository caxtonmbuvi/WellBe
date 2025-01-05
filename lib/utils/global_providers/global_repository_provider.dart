
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/features/mood/repo/mood_repository.dart';
import 'package:interview_app/features/onboarding/repo/onboarding_repository.dart';

class GlobalRepositoryProvider extends StatelessWidget {
  const GlobalRepositoryProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => OnboardingRepository(),
        ),
        RepositoryProvider(
          create: (context) => MoodRepository(),
        ),
        
      ],
      child: child,
    );
  }
}
