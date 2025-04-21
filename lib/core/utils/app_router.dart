import 'package:bookly_app/features/home/presention/views/book_details_view.dart';
import 'package:bookly_app/features/home/presention/views/home_view.dart';
import 'package:bookly_app/features/splash/presention/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final route = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/bookDetails',
      builder: (context, state) => const BookDetailsView(),
    ),
  ]);
}
