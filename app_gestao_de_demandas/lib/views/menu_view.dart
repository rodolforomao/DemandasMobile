import 'package:app_gestao_de_demandas/views/usuario_views/login_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'anotacoes_views/adicionar_anotacao_view.dart';
import 'demandas_views/menu_navigation_bar_demandas.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuView createState() => new _MenuView();
}

//State is information of the application that can change over time or when some actions are taken.
class _MenuView extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Gestão de Demandas",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFF015175),
                Color(0xFF0174a8),
              ],
            ),
          ),
        ),
        textTheme: TextTheme(
            title: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        )),
        actions: <Widget>[
          _SelecionarTopoPopup(context),
        ],
      ),
      body: Form(
        child: Container(
          color: Color(0xFFf4f6f9),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 20.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Card(
                      child: new Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 20.0, bottom: 20.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Demandas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000)),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new MenuNavigationBarDemandas()));
                    },
                  ),
                  InkWell(
                    child: Card(
                      child: new Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 20.0, bottom: 20.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Anotações',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000)),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new AdicionarAnotacaoView()));
                    },
                  ),

                ],
              ),
            ),
          ), /* add child content here */
        ),
      ),
    );
  }

  Widget _SelecionarTopoPopup(cxt) => new PopupMenuButton(
        icon: Icon(Icons.more_vert, color: Color(0xFFFFFFFF), size: 30),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: new InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.build, size: 25, color: Color(0xFF000000)),
                  ),
                  Text('Configuração',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000))),
                  SizedBox(
                    width: 50.0,
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            child: new InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.person_outline,
                        size: 26, color: Color(0xFF000000)),
                  ),
                  Text('Perfil',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000))),
                  SizedBox(
                    width: 50.0,
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            child: new InkWell(
              onTap: () {
                _onSairAplicativoDialog(cxt);
              },
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.exit_to_app,
                        size: 26, color: Color(0xFF000000)),
                  ),
                  Text('Sair',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000))),
                  SizedBox(
                    width: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  void _onSairAplicativoDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Deseja realmente sair?',
            style: TextStyle(
                color: Color(0xFF404040),
                fontFamily: 'BrandonText_Bold',
                fontSize: 18.0),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                  child: Text(
                    'Cancelar',
                    style: TextStyle(
                        color: Color(0xFF404040),
                        fontFamily: 'BrandonText_Bold',
                        fontSize: 17.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        color: Color(0xFF404040),
                        fontFamily: 'BrandonText_Bold',
                        fontSize: 17.0),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    try {
                      Navigator.of(context).pushAndRemoveUntil(
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new LoginView()),
                          (Route<dynamic> route) => false);
                    } catch (error) {
                      //OnToastInformacao(error.toString());
                    }
                  })
            ],
          ),
        );
      },
    );
  }
}
