import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() async{

  List _data=await getJson();

  String _body="";
  for(int i=0;i<_data.length;i++){


  }
  _body=_data[0]['body'];

  runApp(new MaterialApp(
    home: new Scaffold(
         appBar: new AppBar(
           title: new Text("JSON Parse"),
           centerTitle: true,
           backgroundColor: Colors.pinkAccent,
           


         ),
       body: new Center(
         child: new ListView.builder(
             itemCount: _data.length,
             padding: const EdgeInsets.all(16.0),
             itemBuilder: (BuildContext context,int position){
               if(position.isOdd) return new Divider();
               final index=position ~/ 2; //driving position by 2
                return new ListTile(
                  title: new Text("${_data[index]['title']}",style: new TextStyle(fontSize: 18.9),),

                  subtitle: new Text("${_data[index]['body']}",style: new TextStyle(fontSize: 30.4,color: Colors.grey,fontStyle: FontStyle.italic),),
                  
                  leading: new CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: new Text("${_data[index]['title'][0].toString().toUpperCase()}",style: new TextStyle(fontSize: 19.4),),
                  ),

                 onTap:(){_showOnTap(context,"${_data[index]['body']}");}

                );

             }),
       ),
    ),

  ));





}

void _showOnTap(BuildContext context,String message){
  var alert=new AlertDialog(
    title: new Text('Details'),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);},
          child: new Text('OK'))
    ],
  );
 showDialog(context: context,child: alert); //showing the alert
}

//method to fetch data from Json

Future<List> getJson() async{
  String apiUrl="https://jsonplaceholder.typicode.com/posts"; //relevant json url

  http.Response response=await http.get(apiUrl);//to get the response

  return json.decode(response.body);//to decode the jason body,this pass a list view so turn it to string use toString()

}






