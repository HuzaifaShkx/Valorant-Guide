import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:valorant_guide/APIHandler/APIHandler.dart';
import 'package:valorant_guide/models/playerCard.dart';

class PlayerCardScreen extends StatefulWidget {
  const PlayerCardScreen({super.key});

  @override
  State<PlayerCardScreen> createState() => _PlayerCardScreenState();
}

class _PlayerCardScreenState extends State<PlayerCardScreen> {
  List<PlayerCard> cardsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: AppBar(
        title: Text(
          "Player Cards",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      body: FutureBuilder(
        future: APIHandler().getPlayerCard(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          cardsList = snapshot.data!;
          return GridView.builder(
              itemCount: cardsList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Card(
                      elevation: 20,
                      child: cardsList[index].smallArt == null
                          ? CircularProgressIndicator(
                              color: Colors.redAccent[700],
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Image.network(
                                "${cardsList[index].largeArt}",
                                fit: BoxFit.fill,
                              )),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
