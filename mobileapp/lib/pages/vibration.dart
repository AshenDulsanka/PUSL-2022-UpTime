import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Vibration extends StatefulWidget {
  const Vibration({Key? key}) : super(key: key);

  @override
  _VibrationState createState() => _VibrationState();
}

class _VibrationState extends State<Vibration> {
  final databaseRef = FirebaseDatabase.instance.ref().child('sensors');
  String _vibration = '';

  @override
  void initState() {
    super.initState();
    databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        setState(() {
          _vibration = data['vibration'].toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vibrationValue = int.tryParse(_vibration) ?? 0;
    final status = vibrationValue > 25 ? "Status: Vibration is High" : "Status: Normal";

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Vibration Level",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900], // Set app bar color to match background
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),// Remove elevation
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/vibration.png"),
                  width: 200,
                  height: 200,
                  alignment: Alignment.topCenter,
                ),
                SizedBox(height: 50),
                Text(
                  _vibration + " mm/s",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
