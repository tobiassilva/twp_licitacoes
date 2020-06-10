import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../globals.dart';
import '../home_functions.dart';

class HomeWidget {

  BuildContext context;
  HomeWidget(this.context);

  /// BARRA COM O MENU NO TOPO
  Widget barraTopo() {
    final homeFunctions = Provider.of<HomeFunctions>(context);
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            //margin: EdgeInsets.only(left: 20, right: 20),
            child: FlatButton(
              padding: EdgeInsets.all(0),

              onPressed: () {
                homeFunctions.scaffoldKey.currentState.openDrawer();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.all(10),
                    height: 45,
                    width: 45,
                    /*decoration: BoxDecoration(
                        color: StyleGlobals().tertiaryColor,
                        borderRadius: BorderRadius.circular(10)),*/
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[


                            Container(
                              height: 4,
                              width: 17,
                              decoration: BoxDecoration(
                                  color: StyleGlobals().primaryColor,
                                  border: new Border.all(
                                    width: 1.0,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0))),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 7,
                            ),
                            Container(
                              height: 4,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: StyleGlobals().primaryColor,
                                  border: new Border.all(
                                    width: 1.0,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0))),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 7,
                            ),

                            Container(
                              height: 4,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: StyleGlobals().primaryColor,
                                  border: new Border.all(
                                    width: 1.0,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20.0))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Icone Editar
          ///
          Container(
            child: FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: (){

              },
              child: Icon(
                FontAwesomeIcons.userEdit,
                color: StyleGlobals().primaryColor,
                //size: StyleGlobals().sizeTitulo,
              ),
            ),
          ),

        ],
      ),
    );
  }


  Widget botoesTopo(titulo, icone){
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: (){

      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: StyleGlobals().primaryColor
            ),
            child: Icon(icone,
              color: StyleGlobals().textColorSecundary,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            child: Text('$titulo',
              style: TextStyle(
                fontSize: StyleGlobals().sizeText,
                color: StyleGlobals().textColorMedio,
              ),
            ),
          ),
        ],
      ),
    );
  }

}