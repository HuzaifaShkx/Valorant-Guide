import 'package:flutter/material.dart';
import 'package:valorant_guide/APIHandler/APIHandler.dart';
import 'package:valorant_guide/models/agents.dart';

class AgentDetail extends StatefulWidget {
  final String? uuid;
  final String? last;
  const AgentDetail(
    this.uuid,
    this.last, {
    super.key,
  });

  @override
  State<AgentDetail> createState() => _AgentDetailState();
}

class _AgentDetailState extends State<AgentDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse("0xFF${widget.last}")),
      appBar: AppBar(
        title: Text("Agent Details"),
        backgroundColor: Color(int.parse("0xFF${widget.last}")),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: APIHandler().getAgentById(widget.uuid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
            Agents? agent = snapshot.data;
            List<Abilities>? abilitiesList = agent!.abilities;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: Card(
                      child: Stack(fit: StackFit.expand, children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: SweepGradient(
                              colors: agent!.backgroundGradientColors!
                                  .map((hexColor) {
                                return Color(int.parse('0xFF$hexColor'));
                              }).toList(),
                              // begin: Alignment.topLeft,
                              // end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        Image.network("${agent?.background}"),
                        Hero(
                            tag: "imagetag${agent.uuid}",
                            child: Image.network(
                              "${agent?.bustPortrait}",
                              height: 700,
                            ))
                      ]),
                    ),
                  ),
                  Text(
                    "${agent?.displayName}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${agent!.description}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            decorationColor: Colors.white),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Role",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            decorationColor: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "${agent.role!.displayName}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            decorationColor: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${agent.role!.description}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                          decorationColor: Colors.white),
                    ),
                  ),
                  Image.network("${agent.role!.displayIcon}"),
                  SizedBox(height: 5,),
                   Text(
                        "Abilities",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            decorationColor: Colors.white),
                      ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
                      children: [
                        Container(
                          alignment: Alignment.center ,
                          width: 100,
                          
                            decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${abilitiesList![0].displayName}",
                              style: TextStyle(color: Colors.white),
                            )),
                        Container(
                           alignment: Alignment.center ,
                          width: 100,
                           decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("${abilitiesList![1].displayName}",
                                style: TextStyle(color: Colors.white))),
                        Container(
                           alignment: Alignment.center ,
                          width: 100,
                           decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("${abilitiesList![2].displayName}",
                                style: TextStyle(color: Colors.white))),
                  
                               
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                   Container(
                           alignment: Alignment.center ,
                          width: 150,
                           decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text("${abilitiesList![3].displayName}",
                                style: TextStyle(color: Colors.white))),
                ],
              ),
            );
          }),
    );
  }
}
