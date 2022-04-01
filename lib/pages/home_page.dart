import 'package:flutter/material.dart';
import 'package:soccet/models/bitcoin_model.dart';
import 'package:soccet/services/socket_service.dart';

class HomePage extends StatefulWidget {
  static String id = "";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var response = "No Data";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSocketService();

  }
  _initSocketService(){
    SocketService.connectSocketChannel();

    SocketService.channel.stream.listen((event) {
      setState(() {
        if(event!=null){
          Bitcoins bitcoins = SocketService.parseData(event.toString());
          response = bitcoins.data!.price.toString();

        }
      });

    },
    onError: (error){
      setState(() {
        setState(() {
          response = error.toString();
        });
      });
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(response,style: const TextStyle(fontSize: 22),),
          ),
        ),
      ),
    );
  }
}
