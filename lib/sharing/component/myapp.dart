part of 'component.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key, // tambahkan navigator key
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: kDebugMode,
      theme: customDarkTheme,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          binding: MainBinding(),
          page: () => MyHomePage(title: 'Flutter Demo Home Page'),
        ),
        GetPage(
          name: "/detail_screen",
          page: () => DetailScreen(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: "/add_note_screen",
          page: () => AddNoteScreen(),
          binding: AddNoteBinding(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
