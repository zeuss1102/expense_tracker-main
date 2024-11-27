import 'package:expense_repository/expense_repository.dart';
import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:expenses_tracker/screens/home/views/login_page.dart';
import 'package:expenses_tracker/screens/home/views/onboarding_screen.dart';
import 'package:expenses_tracker/screens/home/views/register.page.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/onboarding',
        routes: {
          '/onboarding': (context) => const OnBoardingScreen(),
          '/': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}





