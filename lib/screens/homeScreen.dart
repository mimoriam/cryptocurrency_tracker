import 'package:flutter/material.dart';

// Models:
import 'package:cryptocurrency_tracker/models/CryptoModel.dart';

// Screens:

// Services:
import 'package:cryptocurrency_tracker/services/cryptoService.dart';

// State:

// Widgets:

// Custom:

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fetchAllCoinsURL = 'https://api.coinlore.net/api/tickers/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder<List<Datum>>(
            future: RESTClient(fetchAllCoinsURL).fetchAllCoins(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Datum>? data = snapshot.data;
                return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text("${data[index].name}"),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
