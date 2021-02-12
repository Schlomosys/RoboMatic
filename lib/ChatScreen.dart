import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:intl/intl.dart';

import 'package:robomatic/Message.dart';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:toast/toast.dart';

BuildContext dialogContext;

showAlertDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    backgroundColor:Colors.white60,
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 10),child:Text("Sending=>=>=>")),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      dialogContext = context;
      return alert;
    },
  );
}


class MyChatScreen extends StatefulWidget {
  const MyChatScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyChatState createState() => new _MyChatState();
}

class _MyChatState extends State<MyChatScreen> {

  @override
  void initState() {
    super.initState();

  }
  //Override dispose method
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }


  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final _textController = TextEditingController();
//MessageBos list
  final List<MessageBox> _messages = <MessageBox>[];
  //display toast Messages
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  Future<void> _handleSubmit (String msg, String messageDirection, String date) async {
    //if TextField is empty when user want to submit message
    if (msg.length == 0) {

      // show  "Please Enter Message",
      //show Alert Dialog
     // BuildContext textDialContext;

      showToast("Please Enter Message", gravity: Toast.CENTER);

    } else {
      //clear TextField()
      _textController.clear();
      //Create MessageBox instance
      MessageBox message = new MessageBox(
        sender:"Me",
        message: msg,
        side: messageDirection,
        datetime: date,
      );
      setState(()  {
        //Add the new message to the list of chat messages
        _messages.insert(0, message);
        print("le msg est:"+msg);
        try {
          showAlertDialog(context);
          //call API
          botMaticApiRequest(msg);
        }catch(e){
          print(e.toString());
        }


      }
      );
    }
  }
  //A Future is used to represent a potential value, or error, that will be available at some time in the future.

 Future <void> botMaticApiRequest(String messager) async{
   //get current datetime
    DateTime timer = DateTime.now();
    String sendDateTime = DateFormat('yyyy-MM-dd hh:mm').format(timer);
    // API url
      final url = 'https://robomatic-ai.p.rapidapi.com/api.php';
    //send headers
      final headers = {
        'X-Rapidapi-Key':'Your X-Rapidapi-key',
        'X-Rapidapi-Host':' X-Rapidapi-Host',
       };

      final encoding = Encoding.getByName('utf-8');
      //print(messager);
    //post is use to send data to server
      Response response = await post(
        url,
        headers: headers,

        //the body contains request parameters// The documentation of RoboMatic.AI has all the details on the parameters
        body: {"SessionID": 'RapidAPI1',"in":messager,"op": 'in',"cbid": "1","cbot":'1',"ChatSource": 'RapidAPI',"key": 'Yourkey'},
        encoding: encoding,
      );
      print(response.statusCode.toString());//debugging
    //Check server response
    // If the server returns an OK response,
      if (response.statusCode == 200){
        print('SUCCESS !!!');//debugging
        print(response.body.toString());//debugging
        //decode the json-formatted response.
        var jsonResponse = convert.jsonDecode(response.body);
        var msge = jsonResponse['out'];//get Out Attribute
        print('RoboMsg: $msge.');//debugging
        // if RoboMatic response is empty,
        if(msge=="")
          {
            MessageBox message = new MessageBox(
              sender: "RoboMatic chatbox",
              message:"I'm sorry, but I don't know what you're saying.",
              side: 'leftside',
              datetime: sendDateTime,
            );
            setState(() {
              _messages.insert(0, message);
              Navigator.pop(dialogContext);

            });
          }
        else{
          MessageBox message = new MessageBox(
            sender:"RoboMatic chatbox" ,
            message:msge,
            side: 'leftside',
            datetime: sendDateTime,
          );
          setState(() {
            _messages.insert(0, message);
            Navigator.pop(dialogContext);

          });

        }



      } else if(response.statusCode == 504 || response.statusCode==404){// if there is A 504 Gateway Timeout Error or if the response was umexpected, .
        print('REQUEST FAILED');//debugging
        //show alert dialog
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromRGBO(254,234,230, 0.80),
                title: Text("Error with server" ,style: TextStyle(
                  color: Colors.red,
                  fontSize: 19.0,
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.normal,
                ),),
                content: Text("Error 504 Gateway time out or Bad request ",  style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 17.0,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                ),),
                actions: [
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(dialogContext);


                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        throw Exception('Error 504');
      }

  }



  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);

    return new Scaffold(
        appBar: AppBar(

          title: Text('Chat with RoboMatic' ,style: TextStyle(
          //color: Colors.amber,
            color:Colors.white,
            fontSize: 19.0,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),),
          //backgroundColor: Colors.black,
          backgroundColor: Color.fromRGBO(54,54,154,1.0),
          centerTitle: true,
          shadowColor: Colors.black12,
          bottomOpacity: 0.5,
          toolbarOpacity: 0.8,

        ),
        //Add body to our Scaffold
        body: new Container(
            width: double.infinity,
            height: double.infinity,
            //color: Colors.white70,
            color:Color.fromRGBO(85,75,200, 1.0),
            child:  Container(
              child:  Column(
                children: <Widget>[
                  //child widgets  (input field  and scrolling list) will be added here

                  //Scrolling list//new
                  //Chat list
                  Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    ),
                  ),
                  //divider
                   Divider(height: 1.0),
                   Container(
                      decoration:
                      new BoxDecoration(color: Theme.of(context).cardColor),
                      child: new IconTheme(
                          data: new IconThemeData(
                              color: Theme.of(context).accentColor),
                          child: new Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: new Row(
                              children: <Widget>[

                                new Divider(height: 20.0),//,thickness: 10.0,color: Colors.red,),
                                //Flexible widget wrapping TextField Widget
                                new Flexible(

                                  child: new TextField(

                                    cursorColor: Colors.red,
                                    showCursor: true,
                                    controller: _textController,


                                    decoration: new InputDecoration.collapsed(
                                        hintText: "Enter your message"),
                                  ),
                                ),

                                //responsive Send button

                                new Container(
                                  margin:
                                  new EdgeInsets.symmetric(horizontal: 2.0),
                                  width: 48.0,
                                  height: 48.0,
                                  child: new IconButton(
                                     color:Color.fromRGBO(85,75,200, 1.0),
                                      icon: new Icon(Icons.send_rounded),
                                      onPressed: () async =>
                                      await  _handleSubmit(
                                           _textController.text,
                                          'rightside',
                                          formattedDate)
                                  ),
                                ),
                              ],
                            ),
                          ))),
                ],
              ),
            )));
  }





}