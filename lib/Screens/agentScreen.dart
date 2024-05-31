

import 'package:flutter/material.dart';
import 'package:valorant_guide/APIHandler/APIHandler.dart';
import 'package:valorant_guide/Screens/agentDetail.dart';
import 'package:valorant_guide/models/agents.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  List<Agents> agentRoles = [];
  // _getAgents() async {
  //   agentRoles = await APIHandler().getAgents();
  //   setState(() {
      
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getAgents();
    //print("Agensts length ${agentRoles.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      
      appBar: AppBar(
        title: Text("Agents"),
        centerTitle: true,
        backgroundColor: Colors.redAccent[700],
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: APIHandler().getAgents(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(color: Colors.white,),);
          }
          agentRoles=snapshot.data!;
        return GridView.builder(
            itemCount: agentRoles.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              Agents? agentrole=agentRoles[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentDetail(agentrole.uuid,agentrole.backgroundGradientColors!.last)));  
                  },
                  child: Card(
                    elevation: 25,
                    borderOnForeground: true,
                    child: Stack(
                      
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: RadialGradient(
                  colors: agentrole.backgroundGradientColors!.map((hexColor) {
                    return Color(int.parse('0xFF$hexColor'));
                  }).toList(),
                  // begin: Alignment.topLeft,
                  // end: Alignment.bottomRight,
                            ),
                          ),),
                        
                       Hero(
                        tag: "imagetag${agentrole.uuid}",
                        child: Image.network("${agentrole.fullPortrait}")),
                        Text("${agentrole.displayName}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                    
                      
                      ]
                    ),
                  ),
                ),
              );
        });
        }
      ),
    );
  }
}
