import 'package:flutter/material.dart';

import '../main.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    themeController.addListener(callBack);
    super.initState();
  }

  void callBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: themeController,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeController.isDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }

  @override
  void dispose() {
    themeController.removeListener(callBack);
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Change Notifier - Example",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Theme Changer",
              style: TextStyle(fontSize: 20),
            ),
            Switch(
              value: themeController.isDarkTheme,
              activeColor: Colors.black,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            )
          ],
        ),
      ),
    );
  }
}
