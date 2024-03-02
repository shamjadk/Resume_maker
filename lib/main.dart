import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_maker_app/view/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final darkTheme = useState(false);

    useEffect(() {
      SharedPreferences.getInstance()
          .then((value) => darkTheme.value = value.getBool('theme') ?? false);

      return null;
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme.value
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(),
      home: HomePage(
        themeNotifier: darkTheme,
      ),
    );
  }
}
