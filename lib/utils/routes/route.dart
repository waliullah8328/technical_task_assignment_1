import 'package:flutter/material.dart';
import 'package:technical_task_assignment_1/utils/routes/route_name.dart';
import 'package:technical_task_assignment_1/view/splash_view.dart';
import 'package:technical_task_assignment_1/view/task_list_view.dart';




class Routes{


  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashView(),);


      case RouteName.allTaskList:
        return MaterialPageRoute(builder: (context) => const TaskListView(),);


      default:
        return MaterialPageRoute(builder: (context) => const SplashView(),);
    }

  }
}