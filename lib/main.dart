import 'package:unsplash_test_app/bloc/images_bloc.dart';
import 'package:unsplash_test_app/router.dart';
import 'package:unsplash_test_app/ui/images_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: ImagesBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Unsplash images',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ImagesScreen(),
        onGenerateRoute: Router.generateRoute,
        initialRoute: 'images',
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
