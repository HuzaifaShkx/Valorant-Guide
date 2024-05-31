import "dart:convert";

import "package:http/http.dart" as http;
import "package:valorant_guide/models/agents.dart";
import "package:valorant_guide/models/playerCard.dart";

class APIHandler{

 Future<List<Agents>> getAgents()async{
    
   var response=await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
   List<Agents> agentl=[];
   if(response.statusCode==200){
    dynamic jsonbody=jsonDecode(response.body);
    for(int i=0;i<jsonbody["data"].length;i++){
      Agents agent=Agents.fromJson(jsonbody["data"][i]);
      agentl.add(agent);
    }
   }
   return agentl;

  }

  Future<Agents> getAgentById(String? uuid)async{
  late Agents agent;
   var response=await http.get(Uri.parse("https://valorant-api.com/v1/agents/${uuid}"));
   if(response.statusCode==200){
    dynamic jsonbody=jsonDecode(response.body);
    agent=Agents.fromJson(jsonbody["data"]);  
   }
   return agent;

  }

  Future<List<PlayerCard>> getPlayerCard()async{
    List<PlayerCard> cardList=[];
    var response=await http.get(Uri.parse("https://valorant-api.com/v1/playercards"));
    if(response.statusCode==200){
      dynamic jsonbody=jsonDecode(response.body);
       for(int i=0;i<jsonbody["data"].length;i++){
      PlayerCard card=PlayerCard.fromJson(jsonbody["data"][i]);
      cardList.add(card);
    }
    }
    return cardList;
  }
}

