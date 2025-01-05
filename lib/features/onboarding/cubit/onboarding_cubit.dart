// lib/logic/cubits/onboarding_cubit/onboarding_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/features/onboarding/repo/onboarding_repository.dart';
import 'package:interview_app/utils/model/result.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingRepository onboardingRepository;
  OnboardingCubit(this.onboardingRepository) : super(const OnboardingState());

  Future<void> fetchMotivationalQuote() async {
    emit(state.copyWith(fetchStatus: const Result.loading()));
    try {
      final quote = await onboardingRepository.fetchMotivationalMessage();
      emit(state.copyWith(
        fetchStatus: Result.success(quote),
        message: quote,
      ));
    } catch (e, st) {
      emit(state.copyWith(
        fetchStatus: Result.failure(e.toString(), error: e, stack: st),
      ));
    }
  }
}