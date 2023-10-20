import 'package:flutter/material.dart';
import 'package:pmsn20232/screens/add_task.dart';
import 'package:pmsn20232/screens/dashboard_screen.dart';
import 'package:pmsn20232/screens/detail_movie_screen.dart';
import 'package:pmsn20232/screens/fruit_screen.dart';
import 'package:pmsn20232/screens/login_screen.dart';
import 'package:pmsn20232/screens/popular_screen.dart';
import 'package:pmsn20232/screens/provider_screen.dart';
import 'package:pmsn20232/screens/task_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/dash': (BuildContext context) => DashboardScreen(),
    '/login': (BuildContext context) => LoginScreen(),
    '/task': (BuildContext context) => TaskScreen(),
    '/add': (BuildContext context) => AddTask(),
    '/popular': (BuildContext context) => PopularScreen(),
    '/fruit': (BuildContext context) => FirstScreen(),
    '/detail': (BuildContext context) => DetailMovieScreen(),
    '/prov': (BuildContext context) => ProviderScreen(),
  };
}
