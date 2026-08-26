import 'package:example/example_widget.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [Locale('en'), Locale('ar')],
      home: Scaffold(body: ExampleApp()),
    );
  }
}
