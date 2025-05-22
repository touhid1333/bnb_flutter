import 'package:bnb_flutter/bnb_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bnb Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bnb Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Selected Index : $selectedIndex"),
      ),
      bottomNavigationBar: BnbWidget(
        items: [
          BnbItem(
            iconData: Icons.home,
          ),
          BnbItem(
            iconData: Icons.list,
          ),
          BnbItem(
            iconData: Icons.settings,
          ),
          BnbItem(
            iconData: Icons.book_outlined,
          ),
          BnbItem(
            iconData: Icons.person,
          ),
        ],
        onTap: (p0) => setState(() {
          selectedIndex = p0;
        }),
        selectedIndex: selectedIndex,
        style: BnbStyle(
          iconSize: const Size(24, 24),
        ),
      ),
    );
  }
}
