import 'package:flutter/material.dart';

// Models:
import 'package:cryptocurrency_tracker/models/CryptoModel.dart';

// Screens:

// Services:
import 'package:cryptocurrency_tracker/services/cryptoService.dart';

// State:
import 'package:provider/provider.dart';

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
        body: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Favorites"),
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Placeholder(
                      fallbackWidth: 100,
                      fallbackHeight: 100,
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Market"),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Text("Something"),
                    );
                  },
                ),
              ),
              Builder(
                builder: (BuildContext context) {
                  return Expanded(
                    child: Center(
                      child: FutureBuilder<List<Datum>>(
                        future: RESTClient(fetchAllCoinsURL).fetchAllCoins(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Datum>? data = snapshot.data;
                            return ListView.builder(
                              // itemCount: data!.length,
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return MarketCard(data: data, index: index);
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarketCard extends StatelessWidget {
  const MarketCard({required this.data, required this.index});

  final List<Datum>? data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text("${data![index].name}"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                Image.network(
                    "https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@07fd63a0b662ed99c8ad870ee9227b8ef5e11630/32@2x/black/btc@2x.png"),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text("${data![index].symbol}"),
              Text("${data![index].name}"),
            ],
          ),
          Container(
            width: 190,
          ),
          Container(
            margin: EdgeInsets.only(
              right: 25.0,
            ),
            child: Column(
              children: [
                Text("\$${data![index].priceUsd}"),
                Row(
                  children: [
                    Text("^"),
                    Text("${data![index].percentChange24H}"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
