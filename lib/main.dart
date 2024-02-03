import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firefly/bloc/fly_bloc.dart';
import 'package:firefly/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:native_notify/native_notify.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NativeNotify.initialize(2029, 'or2I21PTBmSwm7h0JqiyHN');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'FireFly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black
      ),
      home: BlocProvider(
        create: (context) => FlyBloc(),
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  int pageIndex = 0;
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlyBloc, FlyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("FireFly"),
            backgroundColor: Colors.deepOrange,
          ),
          body: Main(
            page: widget.pageIndex,
            
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: widget.pageIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.refresh,
                ),
                label: "Live",
                backgroundColor: Colors.deepOrange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notifications",
                backgroundColor: Colors.deepOrange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph),
                label: "Graph",
                backgroundColor: Colors.deepOrange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                backgroundColor: Colors.deepOrange,
              ),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                widget.pageIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
