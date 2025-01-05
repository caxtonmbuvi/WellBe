import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:interview_app/features/dashboard/ui/dashboard_screen.dart';
import 'package:interview_app/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:interview_app/features/onboarding/cubit/onboarding_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_app/utils/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Fetch motivational message on init
    context.read<OnboardingCubit>().fetchMotivationalQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state.fetchStatus.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.fetchStatus.failureMessage != null) {
            return Center(
                child: Text('Error: ${state.fetchStatus.failureMessage}'));
          }

          return PageView(
            controller: _pageController,
            children: [
              _buildPage(
                image: 'assets/images/face1.svg',
                title: 'Welcome to WellBe',
                description:
                    'Track your physical and mental well-being effortlessly.',
              ),
              _buildPage(
                image: 'assets/images/face2.svg',
                title: 'Journaling Made Easy',
                description:
                    'Express your thoughts and emotions with our interactive journaling feature.',
              ),
              _buildPage(
                image: 'assets/images/face3.svg',
                title: 'Insights & Visualization',
                description: state.message,
                isLastPage: true,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
    bool isLastPage = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image, height: 300),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          isLastPage
              ? AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      description,
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
              : Text(
                  description,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
          const SizedBox(height: 40),
          isLastPage
              ? CustomButton(
                  width: double.infinity,
                  text: 'Start Journaling',
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DashboardScreen(),
                    ),
                  ),
                )
              : CustomButton(
                  width: double.infinity,
                  text: 'Next',
                  onTap: () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  ),
                ),
        ],
      ),
    );
  }
}
