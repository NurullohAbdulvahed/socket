import 'package:flutter/material.dart';
import 'package:soccet/services/socket_service.dart';

class MainPage extends StatefulWidget {
  static String id = "";
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var response = "No Data";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketService.connectSocketChannel();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: SocketService.channel.stream,
          builder: (context,snapshot){
            return Center(
              child: Text(
                snapshot.hasData ? '${snapshot.data}' : "No Data",
                style: const TextStyle(fontSize: 22),
              ),
            );
          },
        ),
      )
    );
  }
}
