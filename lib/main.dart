import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _selectedTime;

  Future<void> _show() async{
    final TimeOfDay result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
    if(result != null){
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          _selectedTime != null ? _selectedTime : "No time selected",
          style: TextStyle(
            fontSize: 30
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _show,
        child: Text("Show time picker"),
      ),
    );
  }
}
