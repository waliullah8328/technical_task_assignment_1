import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_task_assignment_1/utils/routes/route.dart';
import 'package:technical_task_assignment_1/utils/routes/route_name.dart';
import 'package:technical_task_assignment_1/view_model/task_list_view_model.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => TaskListProvider(),),




    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technical Task Assignment One',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,

    ));
  }
}