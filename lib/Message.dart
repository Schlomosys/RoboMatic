import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  MessageBox({this.sender, this.message, this.side, this.datetime});
  final String sender;
  final String message;
  final String side;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),

      child: side == 'leftside'//if sender is robomatic
          ? new Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //datetime
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(

                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[

                      new Container(
                        margin: EdgeInsets.only(left: 6.0),
                        decoration: new BoxDecoration(
                          color:Color.fromRGBO(85,75,200, 1.0),
                          //color:Colors.white,
                          //color:Colors.white70 ,//Color.fromRGBO(51, 120, 255, 1.0),
                          border: new Border.all(
                              color:Color.fromRGBO(85,75,200, 1.0),
                              //color:Colors.white,
                           //   color: Colors.white70 ,//Color.fromRGBO(51, 120, 255, 1.0),
                              width: .25,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                        child: new Text(
                          datetime,
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        width: 180.0,
                      ),
                      /*new Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: new CircleAvatar(
                      child: new Text("me"),
                    ),
                  ),*/
                    ],
                  ),
                  //message
                  new Stack(
                    children: <Widget>[

                      new Container(
                        margin: EdgeInsets.only(left: 6.0),
                        decoration: new BoxDecoration(
                            color:Colors.white,
                          //color: Color(0xffd6d6d6),
                          border: new Border.all(
                              color:Colors.white,
                              //color: Color(0xffd6d6d6),
                              width: .25,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(0.0),
                            bottomLeft: Radius.circular(0.0),
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          message,
                          style: new TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        width: 180.0,
                      ),
                    ],
                  ),

                  //sender
                  new Container(
                    margin: EdgeInsets.only(left: 6.0),
                    decoration: new BoxDecoration(
                     // color: Color(0xffd6d6d6),
                      color: Colors.white70,
                      border: new Border.all(
                     //     color: Color(0xffd6d6d6),
                          color: Colors.white70,
                          width: .25,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                    child: new Text(
                      sender,
                      style: new TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                    width: 180.0,
                  ),
                ],
              ),
            ],
          ))
          : new Row( //if sender is user
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          //datetime
          new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Row(

                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                  new Container(
                    margin: EdgeInsets.only(right: 6.0),
                    decoration: new BoxDecoration(
                      color:Color.fromRGBO(85,75,200, 1.0),
                      //color:Colors.white70 ,//Color.fromRGBO(51, 120, 255, 1.0),
                      border: new Border.all(
                          color:Color.fromRGBO(85,75,200, 1.0),
                        //  color: Colors.white70 ,//Color.fromRGBO(51, 120, 255, 1.0),
                          width: .25,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                    child: new Text(
                      datetime,
                      style: new TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                    width: 180.0,
                  ),
                  /*new Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: new CircleAvatar(
                      child: new Text("me"),
                    ),
                  ),*/
                ],
              ),
              //message
              new Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(right: 6.0),
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(127, 124, 255, 1.0),
                      border: new Border.all(
                          color: Color.fromRGBO(127, 124, 255, 1.0),//Color.fromRGBO(51, 120, 255, 1.0),
                          width: .25,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                      ),
                    ),
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      message,
                      style: new TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22.0,
                        color: Color(0xffffffff),
                      ),
                    ),
                    width: 180.0,
                  ),
                ],
              ),

              //sender
              new Container(
                margin: EdgeInsets.only(right: 6.0),
                decoration: new BoxDecoration(
                  //color: Color.fromRGBO(51, 120, 255, 1.0),
                  color: Colors.white70,
                  border: new Border.all(
                      color: Colors.white70,
                    //  color: Color.fromRGBO(51, 120, 255, 1.0),
                      width: .25,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                ),
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                child: new Text(
                  sender,
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                ),
                width: 180.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}